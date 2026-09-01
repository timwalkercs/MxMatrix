import { useEffect, useRef, useState } from 'react';
import './FilterBar.css';

// ponytail: <details name="..."> gives popover open/close and one-at-a-time for free
// sections lets one dropdown hold several checkbox lists (Materials: top / bottom / stem)
function CheckGroup({ label, sections, searchable }) {
    const [query, setQuery] = useState('');
    const needle = query.trim().toLowerCase();
    const chosen = sections.reduce((n, s) => n + s.selected.length, 0);
    const shown = sections
        .map(s => ({ ...s, options: needle ? s.options.filter(o => o.toLowerCase().includes(needle)) : s.options }))
        .filter(s => s.options.length > 0);

    return (
        <details className="filter-group" name="gallery-filter">
            <summary>
                {label}
                {chosen > 0 && <span className="filter-count">{chosen}</span>}
            </summary>
            <div className="filter-menu">
                {searchable && (
                    <input
                        type="text"
                        className="filter-search"
                        placeholder={`Search ${label.toLowerCase()}`}
                        value={query}
                        onChange={(e) => setQuery(e.target.value)}
                    />
                )}
                <div className="filter-options">
                    {shown.map(s => (
                        <div key={s.title || 'only'}>
                            {s.title && <p className="filter-section-title">{s.title}</p>}
                            {s.options.map(o => (
                                <label key={o}>
                                    <input type="checkbox" checked={s.selected.includes(o)} onChange={() => s.onToggle(o)} />
                                    {o}
                                </label>
                            ))}
                        </div>
                    ))}
                    {shown.length === 0 && <p className="filter-empty">No matches</p>}
                </div>
            </div>
        </details>
    );
}

function RangeGroup({ label, unit, step, range, onChange }) {
    const active = range.min !== '' || range.max !== '';
    return (
        <details className="filter-group" name="gallery-filter">
            <summary>
                {label}
                {active && <span className="filter-count">1</span>}
            </summary>
            <div className="filter-menu">
                <div className="filter-range">
                    <input
                        type="number" step={step} min="0" placeholder="Min"
                        value={range.min}
                        onChange={(e) => onChange('min', e.target.value)}
                    />
                    <span>to</span>
                    <input
                        type="number" step={step} min="0" placeholder="Max"
                        value={range.max}
                        onChange={(e) => onChange('max', e.target.value)}
                    />
                    <span className="filter-unit">{unit}</span>
                </div>
            </div>
        </details>
    );
}

function FilterBar({ facets, filters, chips, shown, total, onToggle, onRange, onSilent, onClear }) {
    const barRef = useRef(null);

    // click anywhere outside the bar closes whichever menu is open
    useEffect(() => {
        const close = (e) => {
            if (barRef.current && !barRef.current.contains(e.target)) {
                barRef.current.querySelectorAll('details[open]').forEach(d => { d.open = false; });
            }
        };
        document.addEventListener('mousedown', close);
        return () => document.removeEventListener('mousedown', close);
    }, []);

    return (
        <div className="filter-bar" ref={barRef}>
            <div className="filter-row">
                <CheckGroup label="Brand" searchable sections={[
                    { options: facets.brands, selected: filters.brand, onToggle: (v) => onToggle('brand', v) },
                ]} />
                <CheckGroup label="Type" sections={[
                    { options: facets.types, selected: filters.type, onToggle: (v) => onToggle('type', v) },
                ]} />
                <CheckGroup label="Sound & Feel" searchable sections={[
                    { options: facets.descriptors, selected: filters.descriptor, onToggle: (v) => onToggle('descriptor', v) },
                ]} />
                <CheckGroup label="Materials" searchable sections={[
                    { title: 'Top Housing', options: facets.topHousings, selected: filters.topHousing, onToggle: (v) => onToggle('topHousing', v) },
                    { title: 'Bottom Housing', options: facets.bottomHousings, selected: filters.bottomHousing, onToggle: (v) => onToggle('bottomHousing', v) },
                    { title: 'Stem', options: facets.stemMaterials, selected: filters.stemMaterial, onToggle: (v) => onToggle('stemMaterial', v) },
                ]} />
                <RangeGroup label="Bottom-Out Force" unit="g" step="1"
                    range={filters.bottomOutForce}
                    onChange={(part, v) => onRange('bottomOutForce', part, v)} />
                <RangeGroup label="Total Travel" unit="mm" step="0.1"
                    range={filters.totalTravel}
                    onChange={(part, v) => onRange('totalTravel', part, v)} />

                <label className={`filter-toggle ${filters.silent ? 'on' : ''}`}>
                    <input type="checkbox" checked={filters.silent} onChange={(e) => onSilent(e.target.checked)} />
                    Silent
                </label>
            </div>

            <div className="filter-status">
                <p className="filter-result-count">
                    Showing {shown} of {total} switches
                </p>
                {chips.map(c => (
                    <button key={`${c.group}:${c.value}`} className="filter-chip" onClick={() => c.remove()}>
                        {c.label} <span aria-hidden="true">×</span>
                    </button>
                ))}
                {chips.length > 0 && (
                    <button className="filter-clear" onClick={onClear}>Clear all</button>
                )}
            </div>
        </div>
    );
}

export default FilterBar;
