import { useState, useEffect } from 'react';
import './SwitchDetails.css';
import './Compare.css';
import SwitchImage from './SwitchImage';
import { FIELDS, hasValue } from './switchFields';

function SwitchPicker({ placeholder, selected, loading, onSelect }) {
    const [query, setQuery] = useState('');
    const [results, setResults] = useState([]);
    const [searching, setSearching] = useState(false);
    // only true once "Change" has been clicked, so the page doesn't grab focus on load
    const [focusInput, setFocusInput] = useState(false);

    // same deal as the nav search: wait for a pause in typing, drop superseded replies
    useEffect(() => {
        if (query.trim() === '') {
            setResults([]);
            setSearching(false);
            return;
        }

        setSearching(true);
        let live = true;
        const timer = setTimeout(() => {
            fetch(`/api/mxswitch/search?query=${encodeURIComponent(query)}`)
                .then(res => res.json())
                .catch(() => [])
                .then(data => {
                    if (!live) return;
                    setResults(data);
                    setSearching(false);
                });
        }, 200);

        return () => {
            live = false;
            clearTimeout(timer);
        };
    }, [query]);

    if (loading) {
        return (
            <div className="compare-slot" aria-label="Loading switch">
                <div className="skeleton compare-slot-skeleton" />
                <div className="skeleton compare-slot-line" />
            </div>
        );
    }

    if (selected) {
        return (
            <div className="compare-slot">
                <SwitchImage src={selected.imageUrl} alt={selected.name} />
                <h3>{selected.brand} {selected.name}</h3>
                <button className="compare-change" onClick={() => { setFocusInput(true); onSelect(null); }}>Change</button>
            </div>
        );
    }

    return (
        <div className="compare-slot">
            <div className="compare-placeholder">?</div>
            <input
                type="text"
                placeholder={placeholder}
                value={query}
                autoFocus={focusInput}
                onChange={(e) => setQuery(e.target.value)}
            />
            <ul className="compare-results">
                {searching && results.length === 0 && [0, 1, 2].map(i => (
                    <li key={`compare-skeleton-${i}`} aria-hidden="true">
                        <span className="skeleton compare-result-skeleton" />
                    </li>
                ))}
                {results.map((sw) => (
                    <li key={sw.id}>
                        <button onClick={() => { onSelect(sw.id); setQuery(''); }}>
                            {sw.brand} {sw.name}
                        </button>
                    </li>
                ))}
            </ul>
        </div>
    );
}

function Compare() {
    const [left, setLeft] = useState(null);
    const [right, setRight] = useState(null);
    const [loading, setLoading] = useState({ left: false, right: false });

    const pick = (slot, setter) => (id) => {
        if (id == null) {
            setter(null);
            return;
        }
        setLoading(prev => ({ ...prev, [slot]: true }));
        fetch(`/api/mxswitch/${id}`)
            .then(res => res.json())
            .then(setter)
            .catch(err => console.error("Error fetching switch:", err))
            .finally(() => setLoading(prev => ({ ...prev, [slot]: false })));
    };

    return (
        <div className="page-container">
            <h1>Compare Switches</h1>
            <div className="compare-slots">
                <SwitchPicker placeholder="Search switches..." selected={left} loading={loading.left} onSelect={pick('left', setLeft)} />
                <SwitchPicker placeholder="Search switches..." selected={right} loading={loading.right} onSelect={pick('right', setRight)} />
            </div>

            {(left || right) && (
                <table className="switch-table compare-table">
                    <thead>
                        <tr>
                            <th>{left ? `${left.brand} ${left.name}` : '—'}</th>
                            <th></th>
                            <th>{right ? `${right.brand} ${right.name}` : '—'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {FIELDS
                            .map(f => [f.label, left ? f.get(left) : '', right ? f.get(right) : ''])
                            .filter(([, a, b]) => hasValue(a) || hasValue(b))
                            .map(([label, a, b]) => (
                                <tr key={label}>
                                    <td>{a}</td>
                                    <td>{label}</td>
                                    <td>{b}</td>
                                </tr>
                            ))}
                    </tbody>
                </table>
            )}
        </div>
    );
}

export default Compare;
