// Self-check for the similar-switches ranking: `node src/components/switchSimilarity.test.js`
import assert from 'node:assert/strict';
import { rankSimilar, reason, similarity } from './switchSimilarity.js';

const sw = (id, over = {}) => ({
    id,
    name: `Switch ${id}`,
    brand: 'Gateron',
    type: 'Linear',
    topHousingMaterial: 'Nylon',
    bottomHousingMaterial: 'Nylon',
    stemMaterial: 'POM',
    stemConstruction: 'Standard',
    bottomOutForce: 55,
    totalTravel: 3.5,
    silent: false,
    factoryLubed: true,
    descriptors: ['Thocky'],
    ...over,
});

const current = sw(1);

// a twin scores above a switch that shares nothing
assert.ok(similarity(current, sw(2)) > similarity(current, sw(3, {
    brand: 'Cherry', topHousingMaterial: 'PC', bottomHousingMaterial: 'PC',
    stemMaterial: 'UHMWPE', stemConstruction: 'Box', bottomOutForce: 120,
    totalTravel: 2.0, silent: true, factoryLubed: false, descriptors: ['Clacky'],
})));

// missing specs never blow up, and never fake a match
assert.ok(similarity(current, sw(4, { bottomOutForce: null, totalTravel: null })) < similarity(current, sw(2)));

const pool = [
    current,
    sw(2),                                        // near twin, same type
    sw(3, { bottomOutForce: 62 }),                // same type, further off
    sw(4, { type: 'Tactile' }),                   // strong match, different type
    sw(5, { type: 'Clicky', brand: 'Kailh', topHousingMaterial: 'PC',
            bottomHousingMaterial: 'PC', stemMaterial: 'UHMWPE', stemConstruction: 'Box',
            bottomOutForce: 130, totalTravel: 1.8, silent: true, factoryLubed: false,
            descriptors: [] }),                   // shares nothing but flags
];
// two more Gateron switches with little else in common, so the earlier rows fill up first
const brandMate = { type: 'Clicky', descriptors: [], stemMaterial: 'UHMWPE',
                    topHousingMaterial: 'PC', bottomHousingMaterial: 'PC',
                    bottomOutForce: 90, totalTravel: 2.2 };
pool.push(sw(6, brandMate));
pool.push(sw(7, { ...brandMate, stemConstruction: 'Box', silent: true, factoryLubed: false }));
const { sameType, alike, sameBrand } = rankSimilar(current, pool, 2);

assert.ok(sameType.every(s => s.type === 'Linear'), 'first row is same-type only');
assert.ok(!sameType.some(s => s.id === current.id), 'never recommends the switch being viewed');
assert.equal(sameType[0].id, 2, 'closest same-type switch leads');
assert.ok(!alike.some(s => sameType.find(t => t.id === s.id)), 'rows do not repeat a switch');
assert.equal(alike[0].id, 4, 'cross-type match with matching specs leads the second row');
assert.ok(sameType.length <= 2 && alike.length <= 2, 'row size honoured');

assert.ok(sameBrand.every(s => s.brand === 'Gateron'), 'third row is same-brand only');
assert.equal(sameBrand[0].id, 7, 'a brand-mate the other rows skipped still surfaces');
assert.ok(!sameBrand.some(s => [...sameType, ...alike].find(t => t.id === s.id)), 'no repeats across rows');
assert.deepEqual(rankSimilar(sw(9, { brand: 'Cherry' }), [current], 2).sameBrand, [],
    'no brand row when nothing else carries the brand');

// reasons prefer what actually matched
assert.equal(reason(current, sw(2)), 'Thocky');
assert.equal(reason(current, sw(6, { descriptors: [] })), 'Nylon build');
assert.equal(reason(current, sw(7, { descriptors: [], topHousingMaterial: 'PC',
    bottomHousingMaterial: 'PC', stemMaterial: 'UHMWPE' })), '55g bottom out');

// an empty database is a no-op, not a crash
assert.deepEqual(rankSimilar(current, []), { sameType: [], alike: [], sameBrand: [] });

console.log('switchSimilarity: all checks passed');
