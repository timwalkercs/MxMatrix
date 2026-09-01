import './LearnMore.css';
import { Link } from 'react-router-dom';
import switchGif from '../assets/switchaction.gif';
import linearexample from '../assets/linearexample.jpeg';
import tactileexample from '../assets/tactileexample.jpeg';

const SECTIONS = [
    { id: 'anatomy', label: 'Anatomy' },
    { id: 'types', label: 'Types' },
    { id: 'choosing', label: 'Choosing' },
    { id: 'feel', label: 'Feel' },
    { id: 'sound', label: 'Sound' },
    { id: 'summary', label: 'Summary' },
];

const PARTS = [
    {
        term: 'Stem',
        body: 'The part of the switch that moves up and down during a keystroke. The cross shape acts as the attachment point for the keycaps.',
    },
    {
        term: 'Spring',
        body: 'Beneath the stem is a spring that provides resistance when the switch is pressed. Springs come in various lengths and weights, which play a significant role in typing feel. There are also multi-stage springs with variable threading which can create a progressive level of tension along the length of the keystroke.',
    },
    {
        term: 'Metal Contacts',
        body: 'Two metal contacts, also known as leaves, within the switch that touch to complete a circuit and register an input.',
    },
    {
        term: 'Housing',
        body: 'Switches have a top and bottom housing that clasp together to hold all the components and provide a stable channel to guide the rails of the stem up and down.',
    },
];

const TYPES = [
    {
        type: 'linear',
        name: 'Linear',
        summary: 'Smooth keystroke without tactile bump or click.',
        example: 'Cherry MX Red',
        body: 'Linear switches are the most unassuming and are a good choice for gamers because they are smooth, responsive, and spammable.',
    },
    {
        type: 'tactile',
        name: 'Tactile',
        summary: 'Noticeable bump during keypress for feedback.',
        example: 'Cherry MX Brown',
        body: 'These switches can have varying levels of tactility, ranging from a near-linear feel to a harsh bump for maximum feedback. The location of this bump can also vary from the very beginning of the keystroke to the point of actuation.',
    },
    {
        type: 'clicky',
        name: 'Clicky',
        summary: 'Tactile bump with an audible click from an extra mechanism inside the switch.',
        example: 'Cherry MX Blue',
        body: "This loud 'click' is what many people imagine when they think of mechanical keyboards, but clicky switches are the least common among hobbyists. It's probably best to avoid using these in an office setting out of consideration for your coworkers.",
    },
];

const FEEL_SPECS = [
    {
        term: 'Actuation & Bottom-Out Force',
        body: "Actuation force is the force needed to press a key and register an input. Bottom-out force is the force required for the stem to reach its total travel distance. Indicates how much resistance you'll feel when typing.",
    },
    {
        term: 'Pre-Travel & Total Travel',
        body: 'Pre-travel is how far a key must be pressed to actuate — shorter distances mean faster response. Total travel is the full depth a key can be pressed before bottoming out.',
    },
    {
        term: 'Lubricant',
        body: 'Lubing improves switch smoothness. Many switches now come factory-lubed for better out-of-box performance. If you are a dedicated hobbyist, or up for a challenge, you may decide to hand-lube your switches. But be attentive, consistency is key and too much can make a switch feel mushy.',
    },
];

const SOUND_SPECS = [
    {
        term: 'Top Housing Material',
        body: 'The material used in the top housing can affect the sound of a switch when the spring returns and sends the stem back up. For example, a plastic like polycarbonate (PC) typically allows for a higher-pitched return sound.',
    },
    {
        term: 'Bottom Housing Material',
        body: 'The bottom housing material affects how the switch sounds when it bottoms out. Nylon is a common material used for bottom housings and is associated with a deeper sound signature than something like polycarbonate.',
    },
    {
        term: 'Dampeners (Silent Switches)',
        body: "Sometimes switches can be identified as 'silent' switches. This usually means that some form of dampener is used (rubber or a plastic mechanism) to mute the sound of a switch. Depending where the dampeners are placed, the silencing effect can nullify the sound of the bottom-out, return, or both. Silent switches can be linear or tactile and are a great choice for an office environment.",
    },
    {
        term: 'Lubricant (again)',
        body: 'Lubed switches can deepen the sound of a switch, nullify scratchiness, and eliminate annoying resonance that comes from some springs.',
    },
];

function SpecList({ items }) {
    return (
        <dl className="spec-list">
            {items.map(({ term, body }) => (
                <div key={term} className="spec-item">
                    <dt>{term}</dt>
                    <dd>{body}</dd>
                </div>
            ))}
        </dl>
    );
}

function Source({ href }) {
    return (
        <a className="source-link" href={href} target="_blank" rel="noopener noreferrer">
            Source
        </a>
    );
}

function LearnMore() {
    return (
        <div className="learnmore-wrapper">
            <header className="learn-hero">
                <p className="learn-eyebrow">Guide</p>
                <h1>What Is a Mechanical Switch?</h1>
                <p className="learn-standfirst">
                    A mechanical switch is a physical device that registers a keypress using a spring and metal
                    contact mechanism. Unlike rubber dome or membrane keyboards, mechanical switches offer better
                    durability, tactility, and consistency.
                </p>
                <nav className="learn-toc">
                    {SECTIONS.map(s => (
                        <a key={s.id} href={`#${s.id}`}>{s.label}</a>
                    ))}
                </nav>
            </header>

            <section className="learn-section" id="anatomy">
                <h2>
                    How Do Mechanical Switches Work?
                    <Source href="https://mechanicalkeyboards.com/blogs/mk-101/what-is-a-mechanical-switch" />
                </h2>
                <p>The anatomy of a mechanical switch consists of several key components:</p>
                <SpecList items={PARTS} />

                <figure className="learn-figure">
                    <img src={switchGif} alt="Mechanical Switch Visual" className="learn-image" />
                    <figcaption>Fig 1. Switch actuation visual</figcaption>
                </figure>

                <p>
                    During a keystroke, the stem presses down, compressing the spring and moving a metal contact
                    toward another. When they meet, a signal is sent to the computer. The stem must rise past this
                    point before another keystroke can register.
                </p>
            </section>

            <section className="learn-section" id="types">
                <h2>
                    Types of Switches
                    <Source href="https://www.mechkeybs.com/learn/keyboards-components/linear-vs-tactile-vs-clicky-switches/" />
                </h2>

                <div className="type-cards">
                    {TYPES.map(t => (
                        <article key={t.type} className={`type-card type-${t.type}`}>
                            <h3>{t.name}</h3>
                            <p className="type-summary">{t.summary}</p>
                            <p className="type-example">e.g. {t.example}</p>
                            <p>{t.body}</p>
                        </article>
                    ))}
                </div>

                <figure className="learn-figure">
                    <div className="image-row">
                        <img src={linearexample} alt="Linear switch diagram" className="learn-image" />
                        <img src={tactileexample} alt="Tactile switch diagram" className="learn-image" />
                    </div>
                    <figcaption>Fig 2. Linear vs tactile switches</figcaption>
                </figure>
            </section>

            <section className="learn-section" id="choosing">
                <h2>Picking the Right Switch for You</h2>
                <p>
                    The amount of switches on the market can be overwhelming for consumers. With the sheer mass of
                    options available, it&apos;s important to understand what factors make one switch different from
                    another.
                </p>
            </section>

            <section className="learn-section" id="feel">
                <h2>What Changes the Feel</h2>
                <p>These specifications affect the general typing feel of a switch:</p>
                <SpecList items={FEEL_SPECS} />
            </section>

            <section className="learn-section" id="sound">
                <h2>What Changes the Sound</h2>
                <p>These specifications can affect the sound profile of a switch:</p>
                <SpecList items={SOUND_SPECS} />
                <p className="learn-aside">
                    <a href="https://kineticlabs.com/blog/overview-of-popular-mechanical-keyboard-switch-housing-materials" target="_blank" rel="noopener noreferrer">
                        This blogpost
                    </a>{' '}
                    dives a little deeper into explaining some popular housing materials.
                </p>
            </section>

            <section className="learn-section" id="summary">
                <h2>Summary</h2>
                <p>
                    In short, mechanical keyboard switches can be broken down into a several key components. Slight
                    variations in all of these things come together to give each switch its own personality.
                </p>
                <p>
                    The experience of testing new switches and finding out what you prefer is part of what makes the
                    hobby so enjoyable. This site&apos;s goal is to help educate you and make things a little easier
                    to understand. Take a look at the database and maybe you&apos;ll find a switch that&apos;s right
                    for you!
                </p>
            </section>

            <div className="learnmore-button-wrapper">
                <Link to="/gallery">
                    <button className="gallery-button">Explore Switches</button>
                </Link>
            </div>
        </div>
    );
}

export default LearnMore;
