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
                    <h3>How Do Mechanical Switches Work?</h3>
                    <a href="https://mechanicalkeyboards.com/blogs/mk-101/what-is-a-mechanical-switch" target="_blank" rel="noopener noreferrer">
                        Source
                    </a>
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
                    <h3>Types of Switches</h3>
                    <a href="https://www.mechkeybs.com/learn/keyboards-components/linear-vs-tactile-vs-clicky-switches/" target="_blank" rel="noopener noreferrer">
                        Source
                    </a>
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
                <h2>Why Choose Mechanical Switches?</h2>
                <p>
                    Mechanical switches are preferred by gamers, typists, and enthusiasts for their feel, speed, and longevity.
                    Most are rated for tens of millions of keypresses.
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
