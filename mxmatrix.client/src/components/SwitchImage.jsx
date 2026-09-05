import { useState } from 'react';
import placeholder from '../assets/switch-placeholder.svg';

// Switch photos are hotlinked from another site, so any of them can go missing.
// One <img> wrapper covers both cases: no url in the database, and a url that stops resolving.
function SwitchImage({ src, alt, className }) {
    // photos come off a remote CDN, so hold a shimmer in the frame until one decodes
    const [loaded, setLoaded] = useState(false);

    return (
        <img
            className={`switch-photo ${loaded ? 'is-loaded' : 'skeleton'} ${className || ''}`}
            src={src || placeholder}
            alt={alt}
            onLoad={() => setLoaded(true)}
            onError={(e) => {
                const img = e.currentTarget;
                if (img.dataset.fallback) {         // the placeholder failed too: stop waiting
                    setLoaded(true);
                    return;
                }
                img.dataset.fallback = '1';
                img.src = placeholder;
            }}
        />
    );
}

export default SwitchImage;
