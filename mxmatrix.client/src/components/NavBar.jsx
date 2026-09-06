import { useState, useEffect, useRef, useCallback } from 'react';
import { Link } from 'react-router-dom';
import './NavBar.css';
import logo from '../assets/LogoIcon.png';

function NavBar() {
    const [showOverlay, setShowOverlay] = useState(false);  // controls animation state
    const [isMounted, setIsMounted] = useState(false);       // controls if overlay is in the DOM
    const [query, setQuery] = useState('');
    const [results, setResults] = useState([]);
    const [searching, setSearching] = useState(false);
    const clickStartedInOverlay = useRef(false);

    const fadeDuration = 300; // milliseconds, match this with your CSS

    const toggleOverlay = useCallback(() => {
        if (isMounted) {
            // Start fade-out
            setShowOverlay(false);
            setTimeout(() => {
                setIsMounted(false);
                setQuery('');
                setResults([]);
                setSearching(false);
            }, fadeDuration);
        } else {
            // Start fade-in
            setIsMounted(true);
            setTimeout(() => setShowOverlay(true), 10);
        }
    }, [isMounted]);


    // wait for a pause in typing before asking the server, and ignore a reply that a newer
    // keystroke has already superseded
    useEffect(() => {
        if (query.trim() === '') {
            setResults([]);
            setSearching(false);
            return;
        }

        setSearching(true);
        let live = true;
        const timer = setTimeout(() => {
            fetch(`/api/mxswitch/search?query=${encodeURIComponent(query)}`)
                .then(res => res.json())
                .catch(() => [])
                .then(data => {
                    if (!live) return;
                    setResults(data);
                    setSearching(false);
                });
        }, 200);

        return () => {
            live = false;
            clearTimeout(timer);
        };
    }, [query]);

    // Escape closes the overlay, the way every other search box on the web does
    useEffect(() => {
        if (!isMounted) return;
        const onKeyDown = (e) => {
            if (e.key === 'Escape') toggleOverlay();
        };
        window.addEventListener('keydown', onKeyDown);
        return () => window.removeEventListener('keydown', onKeyDown);
    }, [isMounted, toggleOverlay]);

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
                        <Link to="/compare">
                            <p className="nav-button">COMPARE</p>
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
            {isMounted && (
                <div
                    className={`search-overlay ${showOverlay ? "fade-in" : "fade-out"}`}
                    onMouseDown={handleOverlayMouseDown}
                    onMouseUp={handleOverlayMouseUp}
                >
                    <div className="search-box" onClick={(e) => e.stopPropagation()}>
                        <input
                            type="text"
                            placeholder="Search by brand or switch name..."
                            value={query}
                            onChange={(e) => setQuery(e.target.value)}
                            autoFocus
                        />
                        {searching && results.length === 0 && (
                            <ul className="search-results" aria-hidden="true">
                                {[0, 1, 2].map(i => (
                                    <li key={`searching-${i}`}>
                                        <span className="skeleton search-skeleton" />
                                    </li>
                                ))}
                            </ul>
                        )}
                        {results.length > 0 && (
                            <ul className={`search-results ${searching ? 'is-stale' : ''}`}>
                                {results.map((sw) => (
                                    <li key={sw.id}>
                                        <Link to={`/switchdetails/${sw.id}`} onClick={toggleOverlay}>
                                            <span className="search-result-name">
                                                <span className="search-result-brand">{sw.brand}</span> {sw.name}
                                            </span>
                                            <span className={`search-result-type type-${(sw.type || '').toLowerCase()}`}>
                                                {sw.type}
                                            </span>
                                        </Link>
                                    </li>
                                ))}
                            </ul>
                        )}
                        {query.trim() !== '' && !searching && results.length === 0 && (
                            <p className="search-note">No switches match &ldquo;{query.trim()}&rdquo;</p>
                        )}
                        {query.trim() === '' && (
                            <p className="search-note">Start typing to search the switch database.</p>
                        )}
                    </div>
                </div>
            )}
        </>
    );
}

export default NavBar;
