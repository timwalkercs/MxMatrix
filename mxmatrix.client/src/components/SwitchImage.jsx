import placeholder from '../assets/switch-placeholder.svg';

// Switch photos are hotlinked from another site, so any of them can go missing.
// One <img> wrapper covers both cases: no url in the database, and a url that stops resolving.
function SwitchImage({ src, alt, className }) {
    return (
        <img
            className={className}
            src={src || placeholder}
            alt={alt}
            onError={(e) => {
                const img = e.currentTarget;
                if (img.dataset.fallback) return;   // don't loop if the placeholder itself fails
                img.dataset.fallback = '1';
                img.src = placeholder;
            }}
        />
    );
}

export default SwitchImage;
