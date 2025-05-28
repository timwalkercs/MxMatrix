import './LearnMore.css';
import { Link } from 'react-router-dom';
import switchGif from '../assets/switchaction.gif';
import linearexample from '../assets/linearexample.jpeg';
import tactileexample from '../assets/tactileexample.jpeg';

function LearnMore() {
    return (
        <div className="learnmore-wrapper">
            <h1>What Is a Mechanical Switch?</h1>

            <section className="learn-section">
                <h2>Introduction</h2>
                <p>
                    A mechanical switch is a physical device that registers a keypress using a spring and metal contact mechanism.
                    Unlike rubber dome or membrane keyboards, mechanical switches offer better durability, tactility, and consistency.
                </p>
            </section>

            <section className="learn-section">
                <div className="learn-header">
                    <h3>
                        How Do Mechanical Switches Work?
                    <a href="https://mechanicalkeyboards.com/blogs/mk-101/what-is-a-mechanical-switch" target="_blank" rel="noopener noreferrer">Source</a>
                    </h3>
                </div>

                <p>
                    The anatomy of a mechanical switch consists of several key components:
                </p>
                <ul>
                    <li><strong>Stem:</strong> The stem is the part of the switch that moves up and down during a keystroke.</li>
                    <li><strong>Spring:</strong> Beneath the stem, is a spring that provides resistance when the switch is pressed.</li>
                    <li><strong>Metal Contacts:</strong> Two metal contacts within the switch that touch to complete a circuit and register an input.</li>
                    <li><strong>Housing:</strong> Switches have a top and bottom housing that clasp together to hold all the components and provide stability.</li>
                </ul>
                <div className="lm-image-wrapper">
                    <img
                        src={switchGif}
                        alt="Mechanical Switch Visual"
                        className="learn-image"
                    />
                    <figcaption>Fig 1. Switch Actuation Visual</figcaption>
                </div>
                <p>
                    During a keystroke, the stem presses down, compressing the spring and moving a metal contact toward another. When they meet, a signal is sent to the computer. The stem must rise past this point before another keystroke can register.
                </p>
            </section>

            <section className="learn-section">
                <div className="learn-header">
                    <h3>
                        Types of Switches
                        <a href="https://www.mechkeybs.com/learn/keyboards-components/linear-vs-tactile-vs-clicky-switches/" target="_blank" rel="noopener noreferrer">Source</a>

                    </h3>
                </div>
                <ul>
                    <li><strong>Linear:</strong> Smooth keystroke without tactile bump or click (e.g., Cherry MX Red).</li>
                    <li><strong>Tactile:</strong> Noticeable bump during keypress for feedback (e.g., Cherry MX Brown).</li>
                    <li><strong>Clicky:</strong> Tactile bump with audible click sound due to an additional mechanism inside of the switch (e.g., Cherry MX Blue).</li>
                </ul>

                <figure className="switch-diagram">
                    <div className="image-row">
                        <img
                            src={linearexample}
                            alt="Linear switch diagram"
                            className="learn-image"
                        />
                        <img
                            src={tactileexample}
                            alt="Tactile switch diagram"
                            className="learn-image"
                        />
                    </div>
                    <figcaption>Fig 2. Linear vs Tactile Switches</figcaption>
                </figure>

            </section>

            <section className="learn-section">
                <h2>Picking The Right Switch For You</h2>
                <p>
                    The ammount of switches on the market can be overwhelming for consumers.
                    With the sheer mass of options available, it's important to understand what factors make one switch different from another.
                </p>
            </section>

            <section className="learn-section">
                <div className="learn-header">
                    <h3>
                        Points of Variation
                    </h3>
                </div>

                <p>
                    These specifications affect the general typing feel of a switch:
                </p>
                <ul>
                    <li><strong>Operating/Actuation Force and Bottom-Out Force:</strong> Actuation force is the force needed to press a key and register an input. Bottom-out force is the force required for the stem to reach its total travel distance. Indicates how much resistance you'll feel when typing.</li>

                    <li>
                        <strong>Pre-Travel & Total Travel Distance:</strong> Pre-travel is how far a key must be pressed to actuate - shorter distances mean faster response. Total travel is the full depth a key can be pressed before bottoming out.
                    </li>

                    <li>
                        <strong>Lubricant:</strong> Lubing improves switch smoothness. Many switches now come factory-lubed for better out-of-box performance. If you are dedicated hobbyist, or up for a challenge, you may decide to hand-lube your switches. But be attentive, consistency is key and too much can make a switch feel mushy.
                    </li>
                </ul>

                <p>
                    These specifications can affect the sound profile of a switch:
                </p>
                <ul>
                    <li>
                        <strong>Top Housing Material:</strong> The material used in the top housing can affect the sound of a switch when the spring returns and sends the stem back up.
                        For example, a plastic like polycarbonate (PC) typically allows for a higher-pitched return sound.
                    </li>

                    <li>
                        <strong>Bottom Housing Material:</strong> The bottom housing material affects how the switch sounds when it bottoms out.
                        Nylon is a common material used for bottom housings and is associated with a deeper sound signature than something like polycarbonate.
                    </li>

                    <li>
                        <strong>Dampeners (Silent Switches):</strong> Sometimes switches can be identified as 'silent' switches. This usually means that some form of dampener is used (rubber or a plastic mechanism) to mute the sound of a switch.
                        Depending where the dampeners are placed, the silencing effect can nullify the sound of the bottom-out, return, or both. Silent switches can be linear or tactile and are a great choice for an office environment.
                    </li>

                    <li>
                        <strong>Lubricant (again):</strong> Lubed switches can deepen the sound of a switch, nullify scratchiness, and eliminate annoying resonance that comes from some springs.
                    </li>
                </ul>

                <p>
                    <a href="https://kineticlabs.com/blog/overview-of-popular-mechanical-keyboard-switch-housing-materials" target="_blank" rel="noopener noreferrer">This blogpost </a>
                    dives a little deeper into explaining some popular housing materials.
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
