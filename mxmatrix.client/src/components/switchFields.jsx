// Shared attribute list for the details table and the compare table.
// get() returns the display string, or '' when the switch has no entry — empty rows are dropped.
export const FIELDS = [
    { label: 'Manufacturer', get: s => s.manufacturer },
    {
        label: 'Type',
        get: s => s.type,
        tooltip: (
            <>
                <strong>Linear</strong> switches provide a smooth keystroke. <br /><br /> <strong>Tactile</strong> switches differ from linear switches in that there is a noticeable "bump" in the keystroke, often at the actuation point. <br /><br /> <strong>Clicky</strong> switches have the same tactile bump, but also have a distinct, audible, click that comes from an additional mechanism not present in linears/tactiles.
            </>
        )
    },
    { label: 'Top Housing', get: s => s.topHousingMaterial },
    { label: 'Bottom Housing', get: s => s.bottomHousingMaterial },
    { label: 'Stem Material', get: s => s.stemMaterial },
    {
        label: 'Stem Construction',
        get: s => s.stemConstruction,
        tooltip: 'Some stems are made with an enclosure around them that minimizes stem-wobble, increases grip on the keycaps, and prevents dust from getting inside the mechanism.'
    },
    { label: 'Spring', get: s => s.springDescription },
    {
        label: 'Mount Type',
        get: s => s.mountType != null ? s.mountType + '-pin' : '',
        tooltip: '3-pin switches offer the most compatibility with keyboard PCBs while 5-pin switches allow for the most secure mounting experience. If your PCB only has 3 pin slots, clipping the additional plastic pins on 5-pin switches is a simple workaround.'
    },
    {
        label: 'Actuation Force',
        get: s => s.actuationForce != null ? s.actuationForce + 'g' : '',
        tooltip: 'The force required to actuate the switch. This is affected by the spring which can vary in length, weight, and number of stages.'
    },
    {
        label: 'Bottom-Out Force',
        get: s => s.bottomOutForce != null ? s.bottomOutForce + 'g' : '',
        tooltip: "The force required to bottom-out the switch. Some people prefer heavier spring weights to prevent bottoming out for a 'floaty' typing feel."
    },
    {
        label: 'Pre-Travel',
        get: s => s.preTravel != null ? s.preTravel + 'mm' : '',
        tooltip: 'The distance the stem needs to travel in order for the switch to actuate. A lower number typically means quicker response time.'
    },
    {
        label: 'Total Travel',
        get: s => s.totalTravel != null ? s.totalTravel + 'mm' : '',
        tooltip: (
            <>
                The total distance the stem travels before it bottoms out. Stems with longer poles and switches with dampeners often have a shorter total travel. Bottoming out on the pole, with no dampeners, creates a sharper typing feel leads to a clackier sound profile. <br /><br /><i>The standard total travel distance is 4.0mm.</i>
            </>
        )
    },
    { label: 'Factory Lube', get: s => s.factoryLubed != null ? (s.factoryLubed ? 'Yes' : 'No') : '' },
    {
        label: 'Silent',
        get: s => s.silent != null ? (s.silent ? 'Yes' : 'No') : '',
        tooltip: (
            <>
                Silent switches achieve their quiet operation by utilizing dampening materials like rubber or silicone to absorb the vibrations and reduce the sound of keystrokes. This is primarily done by adding dampeners on the switch stem, rails, or housings. <br /><br /><i>These dampeners can shorten travel distance and create a 'mushy' feel.</i>
            </>
        )
    },
    { label: 'Descriptors', get: s => (s.descriptors || []).join(', ') },
];

export const hasValue = (v) => v !== null && v !== undefined && v !== '';
