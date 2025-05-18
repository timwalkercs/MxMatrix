import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import './NavBar.css';
import logo from '../assets/LogoIcon.png';

function NavBar() {
    const [showOverlay, setShowOverlay] = useState(false);
    const [query, setQuery] = useState('');
    const [results, setResults] = useState([]);
    const clickStartedInOverlay = useRef(false);

    const toggleOverlay = () => setShowOverlay(prev => !prev);

    useEffect(() => {
        if (query.trim() !== '') {
            fetch(`/api/mxswitch/search?query=${encodeURIComponent(query)}`)
                .then(res => res.json())
                .then(data => setResults(data))
                .catch(() => setResults([]));
        } else {
            setResults([]);
        }
    }, [query]);


    //Below handlers prevent clicks started from outside of overlay from closing
    const handleOverlayMouseDown = (e) => {
        if (e.target.classList.contains('search-overlay')) {
            clickStartedInOverlay.current = true;
        } else {
            clickStartedInOverlay.current = false;
        }
    };

    const handleOverlayMouseUp = (e) => {
        if (e.target.classList.contains('search-overlay') && clickStartedInOverlay.current) {
            toggleOverlay();
        }
    };

    return (
        <>
            <nav className="navbar">
                <div className="nav-contents">
                    <div className="nav-left">
                        <Link to="/gallery">
                            <p className="nav-button">SWITCHES</p>
                        </Link>
                    </div>
                    <div className="nav-center">
                        <Link to="/">
                            <img src={logo} alt="Logo" className="nav-logo" />
                        </Link>
                    </div>
                    <div className="nav-right">
                        <p className="nav-button" onClick={toggleOverlay}>SEARCH</p>
                    </div>
                </div>
            </nav>

            {/* Search Bar Overlay */}
            {showOverlay && (
                <div
                    className="search-overlay"
                    onMouseDown={handleOverlayMouseDown}
                    onMouseUp={handleOverlayMouseUp}
                >
                    <div className="search-box" onClick={(e) => e.stopPropagation()}>
                        <input
                            type="text"
                            placeholder="Search switches..."
                            value={query}
                            onChange={(e) => setQuery(e.target.value)}
                            autoFocus
                        />
                        <ul className="search-results">
                            {results.map((sw) => (
                                <li key={sw.switch_id}>
                                    <Link to={`/switchdetails/${sw.id}`} onClick={toggleOverlay}>
                                        {sw.brand} {sw.name}
                                    </Link>
                                </li>
                            ))}
                        </ul>
                    </div>
                </div>
            )}
        </>
    );
}

export default NavBar;
