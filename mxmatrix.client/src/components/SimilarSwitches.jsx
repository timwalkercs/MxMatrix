import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import './SimilarSwitches.css';
import SwitchImage from './SwitchImage';
import { rankSimilar, reason } from './switchSimilarity';

function Row({ title, blurb, switches, current }) {
    if (!switches.length) return null;

    return (
        <section className="similar-row">
            <h3>{title}</h3>
            <div className="similar-blurb">{blurb}</div>
            <div className="similar-grid">
                {switches.map(sw => (
                    <Link to={`/switchdetails/${sw.id}`} key={sw.id} className="similar-card">
                        <SwitchImage src={sw.imageUrl} alt={sw.name} />
                        <div className="similar-brand">{sw.brand}</div>
                        <div className="similar-name">{sw.name}</div>
                        <div className={`similar-type type-${(sw.type || '').toLowerCase()}`}>
                            {sw.type}
                        </div>
                        <div className="similar-reason">{reason(current, sw)}</div>
                    </Link>
                ))}
            </div>
        </section>
    );
}

function SimilarSwitches({ current }) {
    const [switches, setSwitches] = useState([]);
    const [loading, setLoading] = useState(true);

    // the gallery's list endpoint already carries every field the scoring needs, so no new API
    useEffect(() => {
        fetch('/api/mxswitch')
            .then(res => res.json())
            .then(setSwitches)
            .catch(err => console.error('Error fetching switches:', err))
            .finally(() => setLoading(false));
    }, []);

    const { sameType, alike, sameBrand } = useMemo(
        () => rankSimilar(current, switches),
        [switches, current]
    );

    if (loading) {
        return (
            <div className="similar-switches">
                <h2>You might also like...</h2>
                <div className="similar-grid" aria-label="Loading recommendations">
                    {Array.from({ length: 6 }, (_, i) => (
                        <div key={`similar-skeleton-${i}`} className="similar-card similar-card-loading">
                            <div className="skeleton similar-skeleton-image" />
                            <div className="skeleton similar-skeleton-line" />
                            <div className="skeleton similar-skeleton-line short" />
                        </div>
                    ))}
                </div>
            </div>
        );
    }

    if (!sameType.length && !alike.length && !sameBrand.length) return null;

    return (
        <div className="similar-switches">
            <h2>You might also like...</h2>
            <Row
                title={`More ${current.type} switches`}
                blurb={`Other ${(current.type || '').toLowerCase()} switches that compare to the ${current.name}.`}
                switches={sameType}
                current={current}
            />
            <Row
                title="Similar specs, materials & feel"
                blurb="Matched on sound and feel descriptors, housing and stem materials, weight, and travel."
                switches={alike}
                current={current}
            />
            <Row
                title={`More from ${current.brand}`}
                blurb={`The rest of the ${current.brand} lineup in the database.`}
                switches={sameBrand}
                current={current}
            />
        </div>
    );
}

export default SimilarSwitches;
