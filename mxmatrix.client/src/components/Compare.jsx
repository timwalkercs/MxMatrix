import { useState, useEffect } from 'react';
import './SwitchDetails.css';
import './Compare.css';
import { FIELDS, hasValue } from './switchFields';

function SwitchPicker({ placeholder, selected, onSelect }) {
    const [query, setQuery] = useState('');
    const [results, setResults] = useState([]);
    // only true once "Change" has been clicked, so the page doesn't grab focus on load
    const [focusInput, setFocusInput] = useState(false);

    useEffect(() => {
        if (query.trim() === '') {
            setResults([]);
            return;
        }
        fetch(`/api/mxswitch/search?query=${encodeURIComponent(query)}`)
            .then(res => res.json())
            .then(data => setResults(data))
            .catch(() => setResults([]));
    }, [query]);

    if (selected) {
        return (
            <div className="compare-slot">
                <img src={selected.imageUrl} alt={selected.name} />
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

    const pick = (setter) => (id) => {
        if (id == null) {
            setter(null);
            return;
        }
        fetch(`/api/mxswitch/${id}`)
            .then(res => res.json())
            .then(setter)
            .catch(err => console.error("Error fetching switch:", err));
    };

    return (
        <div className="page-container">
            <h1>Compare Switches</h1>
            <div className="compare-slots">
                <SwitchPicker placeholder="Search switches..." selected={left} onSelect={pick(setLeft)} />
                <SwitchPicker placeholder="Search switches..." selected={right} onSelect={pick(setRight)} />
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
