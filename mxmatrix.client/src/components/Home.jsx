import './Home.css';
import SwitchImage from './SwitchImage';
import { Link } from 'react-router-dom';
import { useEffect, useState } from 'react';

function Home() {
    const [recentSwitches, setRecentSwitches] = useState([]);
    useEffect(() => {
        fetch('/api/mxswitch/recent')
            .then(res => {
                if (!res.ok) {
                    throw new Error('Failed to fetch recent switches');
                }
                return res.json();
            })
            .then(data => setRecentSwitches(data))
            .catch(err => {
                console.error('Error fetching recent switches:', err);
                setRecentSwitches([]); // Fallback to empty
            });
    }, []);
    return (

        <div className="homepage">
            <h1>Welcome to MxMatrix</h1>
            <h4>Your curated database for mechanical keyboard switches.</h4>

            <Link to="/gallery">
                <button className="gallery-button">Browse The Database</button>
            </Link>

            <div className="features">
                <div className="feature-card">
                    <h3>Multiple Filtering Methods</h3>
                    <p>Find switches by brand, type, feel, sound profile, and more.</p>
                </div>
                <div className="feature-card">
                    <h3>Detailed Specs</h3>
                    <p>View each switches specifications such as actuation/bottom-out force, travel distance, and housing materials.</p>
                </div>
                <div className="feature-card">
                    <h3>Descriptor Tags</h3>
                    <p>Understand a switch's personality with commonly used descriptors like "thocky" and "clacky".</p>
                </div>
            </div>

            <p>Are you new to the scene?</p>
            <Link to="/learnmore">
                <button className="learn-more-button">Learn More</button>
            </Link>

            <h2>Recently Added Switches</h2>
            <div className="carousel" mask>
                {recentSwitches.map((s, idx) => (
                    <div key={idx} style={{ '--i': idx % recentSwitches.length }}>
                        <Link to={`/switchdetails/${s.id}`} key={s.id} className="recent-card">
                            <div className="image-wrapper">
                                <SwitchImage src={s.imageUrl} alt={`${s.brand} ${s.name}`} />
                                <div className="overlay">
                                    <p>{s.brand} {s.name}</p>
                                </div>
                            </div>
                        </Link>
                    </div>
                ))}
            </div>

        </div>
    );
}

export default Home;