import React, { useEffect, useState } from 'react';
import './ForceComparisonBar.css';
import Progress from 'react-circle-progress-bar';

function ForceComparisonBar({ currentForce }) {
    const [range, setRange] = useState({ min: 0, max: 100 }); // placeholder

    const [ready, setReady] = useState(false);

    useEffect(() => {
        async function fetchRange() {
            try {
                const response = await fetch('/api/mxswitch/bottomout-range');
                const data = await response.json();
                setRange({ min: data.min, max: data.max });
            } catch (error) {
                console.error('Failed to fetch force range:', error);
            } finally {
                // on failure the bar still draws, just against the placeholder range
                setReady(true);
            }
        }

        fetchRange();
    }, []);

    const { min, max } = range;

    // Normalize the current value between 0 and 100 for placement
    const percent = ((currentForce - min) / (max - min)) * 100;

    return (
        <div className="radial-force-bar">        <div className="travel-bar-container">
            <span className="bar-header">Bottom-Out Force</span>
            {/* the ring would sit at the wrong angle until the real range lands, so hold a shimmer */}
            {ready ? (
            <div className="radial-travel-bar">
                <span className="min-travel">{min + "g"}</span>
                <Progress progress={percent} reduction='.5' hideValue='true'/>
                <span className="max-travel">{max + "g"}</span>
            </div>
            ) : (
            <div className="radial-travel-bar">
                <span className="skeleton bar-label-skeleton" />
                <span className="skeleton bar-ring-skeleton" />
                <span className="skeleton bar-label-skeleton" />
            </div>
            )}
        </div>
        </div>
    );
}

export default ForceComparisonBar;
