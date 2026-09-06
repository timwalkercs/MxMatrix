import './Home.css';
import SwitchImage from './SwitchImage';
import { Link } from 'react-router-dom';
import { useEffect, useState } from 'react';

const CAROUSEL_SIZE = 5;

// the photos are hotlinked from another site, so a url in the database is no promise
// that it still resolves - only carousel switches whose image really loads
const imageLoads = (src) => new Promise((resolve) => {
    if (!src) {
        resolve(false);
        return;
    }
    const probe = new Image();
    probe.onload = () => resolve(true);
    probe.onerror = () => resolve(false);
    probe.src = src;
});

function Home() {
    const [recentSwitches, setRecentSwitches] = useState([]);
    const [loading, setLoading] = useState(true);
    useEffect(() => {
        let cancelled = false;
        fetch('/api/mxswitch/recent')
            .then(res => {
                if (!res.ok) {
                    throw new Error('Failed to fetch recent switches');
                }
                return res.json();
            })
            .then(data => Promise.all(data.map(sw => imageLoads(sw.imageUrl)))
                .then(ok => data.filter((_, i) => ok[i]).slice(0, CAROUSEL_SIZE)))
            .then(usable => {
                if (!cancelled) setRecentSwitches(usable);
            })
            .catch(err => {
                console.error('Error fetching recent switches:', err);
                setRecentSwitches([]); // Fallback to empty
            })
            // the wait covers the fetch and the image probing that follows it
            .finally(() => {
                if (!cancelled) setLoading(false);
            });
        return () => { cancelled = true; };
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
            {loading ? (
                <div className="carousel-loading" aria-label="Loading recently added switches">
                    {Array.from({ length: CAROUSEL_SIZE }, (_, i) => (
                        <div key={`recent-skeleton-${i}`} className="skeleton" />
                    ))}
                </div>
            ) : (
            <div className="carousel" style={{ '--items': recentSwitches.length }}>
                {recentSwitches.map((s, idx) => (
                    <div key={s.id} style={{ '--i': idx }}>
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
            )}

        </div>
    );
}

export default Home;