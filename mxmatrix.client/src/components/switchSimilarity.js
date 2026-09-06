// Scoring behind the "You might also like" rows on a switch's detail page.
// Kept out of the component so it can be exercised on its own - see switchSimilarity.test.js.

// Closeness on a numeric spec: 1 when identical, 0 once the gap reaches `tolerance`.
export const proximity = (a, b, tolerance) =>
    a == null || b == null ? 0 : Math.max(0, 1 - Math.abs(a - b) / tolerance);

export const sharedDescriptors = (a, b) =>
    (b.descriptors || []).filter(d => (a.descriptors || []).includes(d));

// ponytail: hand-tuned weights, and deliberately no term for type - the two rows split on type
// themselves. Retune here if a row looks wrong; a learned model is overkill for a few hundred rows.
export function similarity(current, other) {
    const same = (field) => current[field] && current[field] === other[field];

    return 3 * sharedDescriptors(current, other).length
        + (same('topHousingMaterial') ? 2 : 0)
        + (same('bottomHousingMaterial') ? 2 : 0)
        + (same('stemMaterial') ? 2 : 0)
        + (same('stemConstruction') ? 1 : 0)
        + (same('brand') ? 1 : 0)
        + (current.silent === other.silent ? 0.5 : 0)
        + (current.factoryLubed === other.factoryLubed ? 0.5 : 0)
        + 2.5 * proximity(current.bottomOutForce, other.bottomOutForce, 25)   // grams
        + 2 * proximity(current.totalTravel, other.totalTravel, 1.2);         // mm
}

// One short line under a card saying why it turned up.
export function reason(current, other) {
    const descriptors = sharedDescriptors(current, other);
    if (descriptors.length) return descriptors.slice(0, 2).join(', ');

    const material = ['topHousingMaterial', 'bottomHousingMaterial', 'stemMaterial']
        .find(field => current[field] && current[field] === other[field]);
    if (material) return `${other[material]} build`;

    if (proximity(current.bottomOutForce, other.bottomOutForce, 25) > 0.75) {
        return `${other.bottomOutForce}g bottom out`;
    }
    if (current.brand && current.brand === other.brand) return `Also from ${other.brand}`;
    return other.type;
}

// Three rows, each picked from what the earlier rows left over so nothing appears twice:
// same-type neighbours, then the best matches on specs and materials whatever their type,
// then the rest of the brand's lineup.
export function rankSimilar(current, all, rowSize = 6) {
    const ranked = all
        .filter(sw => sw.id !== current.id)
        .map(sw => ({ sw, score: similarity(current, sw) }))
        .sort((a, b) => b.score - a.score);

    const shown = new Set();
    const take = (keep) => {
        const row = ranked.filter(r => !shown.has(r.sw.id) && keep(r)).slice(0, rowSize).map(r => r.sw);
        row.forEach(sw => shown.add(sw.id));
        return row;
    };

    return {
        sameType: take(r => r.sw.type === current.type),
        alike: take(r => r.score > 0),
        sameBrand: take(r => current.brand && r.sw.brand === current.brand),
    };
}
