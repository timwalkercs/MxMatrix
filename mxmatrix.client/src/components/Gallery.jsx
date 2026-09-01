import { useEffect, useMemo, useState } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import './Gallery.css';
import FilterBar from './FilterBar';
import SwitchImage from './SwitchImage';

// filter state lives in the query string, so a filtered gallery can be shared and survives a reload
const MULTI = {
    brand: 'brand',
    type: 'type',
    descriptor: 'sound',
    topHousing: 'top',
    bottomHousing: 'bottom',
    stemMaterial: 'stem',
};
const RANGES = { bottomOutForce: 'force', totalTravel: 'travel' };
const LABELS = {
    brand: 'Brand', type: 'Type', descriptor: 'Sound & Feel', topHousing: 'Top',
    bottomHousing: 'Bottom', stemMaterial: 'Stem',
    bottomOutForce: 'Force', totalTravel: 'Travel',
};

function parseFilters(params) {
    const f = { silent: params.get('silent') === '1' };
    for (const [key, name] of Object.entries(MULTI)) {
        const raw = params.get(name);
        f[key] = raw ? raw.split(',').filter(Boolean) : [];
    }
    for (const [key, name] of Object.entries(RANGES)) {
        const [min = '', max = ''] = (params.get(name) || '').split('~');
        f[key] = { min, max };
    }
    return f;
}

function toParams(f) {
    const p = new URLSearchParams();
    for (const [key, name] of Object.entries(MULTI)) {
        if (f[key].length) p.set(name, f[key].join(','));
    }
    for (const [key, name] of Object.entries(RANGES)) {
        if (f[key].min !== '' || f[key].max !== '') p.set(name, `${f[key].min}~${f[key].max}`);
    }
    if (f.silent) p.set('silent', '1');
    return p;
}

const uniqueSorted = (list) => [...new Set(list.filter(Boolean))].sort((a, b) => a.localeCompare(b));

function Gallery() {
    const [switches, setSwitches] = useState([]);
    const [descriptors, setDescriptors] = useState([]);
    const [searchParams, setSearchParams] = useSearchParams();

    const filters = useMemo(() => parseFilters(searchParams), [searchParams]);

    useEffect(() => {
        Promise.all([
            fetch('/api/mxswitch').then(response => response.json()),
            fetch('/api/mxswitch/descriptors').then(response => response.json())
        ])
            .then(([data, descData]) => {
                setSwitches(data);
                setDescriptors(descData);
            })
            .catch(error => console.error('Error fetching switches:', error));
    }, []);

    const facets = useMemo(() => ({
        brands: uniqueSorted(switches.map(sw => sw.brand)),
        types: ['Linear', 'Tactile', 'Clicky'],
        descriptors: uniqueSorted(descriptors.map(d => d.name)),
        topHousings: uniqueSorted(switches.map(sw => sw.topHousingMaterial)),
        bottomHousings: uniqueSorted(switches.map(sw => sw.bottomHousingMaterial)),
        stemMaterials: uniqueSorted(switches.map(sw => sw.stemMaterial)),
    }), [switches, descriptors]);

    const filteredSwitches = useMemo(() => {
        const inSet = (chosen, value) => chosen.length === 0 || chosen.includes(value);
        const inRange = (range, value) =>
            (range.min === '' || value >= parseFloat(range.min)) &&
            (range.max === '' || value <= parseFloat(range.max));

        return switches.filter(sw =>
            inSet(filters.brand, sw.brand) &&
            inSet(filters.type, sw.type) &&
            inSet(filters.topHousing, sw.topHousingMaterial) &&
            inSet(filters.bottomHousing, sw.bottomHousingMaterial) &&
            inSet(filters.stemMaterial, sw.stemMaterial) &&
            (!filters.silent || sw.silent === true) &&
            // descriptors stack: a switch must carry every one that's checked
            filters.descriptor.every(d => (sw.descriptors || []).includes(d)) &&
            inRange(filters.bottomOutForce, sw.bottomOutForce ?? 0) &&
            inRange(filters.totalTravel, sw.totalTravel ?? 0)
        );
    }, [switches, filters]);

    const apply = (next) => setSearchParams(toParams(next), { replace: true });

    const toggle = (group, value) => apply({
        ...filters,
        [group]: filters[group].includes(value)
            ? filters[group].filter(v => v !== value)
            : [...filters[group], value],
    });

    const setRange = (group, part, value) => apply({
        ...filters,
        [group]: { ...filters[group], [part]: value },
    });

    const chips = [
        ...Object.keys(MULTI).flatMap(group => filters[group].map(value => ({
            group,
            value,
            label: `${LABELS[group]}: ${value}`,
            remove: () => toggle(group, value),
        }))),
        ...Object.keys(RANGES)
            .filter(group => filters[group].min !== '' || filters[group].max !== '')
            .map(group => ({
                group,
                value: 'range',
                label: `${LABELS[group]}: ${filters[group].min || '0'}–${filters[group].max || '∞'}`,
                remove: () => apply({ ...filters, [group]: { min: '', max: '' } }),
            })),
        ...(filters.silent ? [{
            group: 'silent',
            value: 'yes',
            label: 'Silent',
            remove: () => apply({ ...filters, silent: false }),
        }] : []),
    ];

    return (
        <div className="gallerydiv">
            <h1>Switch Gallery</h1>

            <FilterBar
                facets={facets}
                filters={filters}
                chips={chips}
                shown={filteredSwitches.length}
                total={switches.length}
                onToggle={toggle}
                onRange={setRange}
                onSilent={(v) => apply({ ...filters, silent: v })}
                onClear={() => setSearchParams(new URLSearchParams(), { replace: true })}
            />

            <div className="grid">
                {filteredSwitches.map((sw) => (
                    <div key={sw.id} className="card">
                        <Link to={`/switchdetails/${sw.id}`} className="card-link">
                            <SwitchImage src={sw.imageUrl} alt={sw.name} />
                        </Link>
                        <div className="title">
                            <Link to={`/switchdetails/${sw.id}`} className="card-link">
                                <p id="brand">{sw.brand}</p>
                                <p>{sw.name}</p>
                            </Link>
                            <p className={`type type-${(sw.type || '').toLowerCase()}`}>{sw.type}</p>
                        </div>
                    </div>
                ))}
            </div>

            {switches.length > 0 && filteredSwitches.length === 0 && (
                <p className="gallery-empty">No switches match these filters.</p>
            )}
        </div>
    );
}

export default Gallery;
