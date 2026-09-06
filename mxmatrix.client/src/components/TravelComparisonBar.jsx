import React, { useEffect, useState } from 'react';
import './TravelComparisonBar.css';
import Progress from 'react-circle-progress-bar';

function TravelComparisonBar({ currentTotalTravel }) {
    const [range, setRange] = useState({ min: 0, max: 4 }); // placeholder

    const [ready, setReady] = useState(false);

    useEffect(() => {
        async function fetchRange() {
            try {
                const response = await fetch('/api/mxswitch/totaltravel-range');
                const data = await response.json();
                setRange({ min: data.min, max: data.max });
            } catch (error) {
                console.error('Failed to fetch total-travel range:', error);
            } finally {
                // on failure the bar still draws, just against the placeholder range
                setReady(true);
            }
        }

        fetchRange();
    }, []);

    const { min, max } = range;

    // Normalize the current value between 0 and 100 for placement
    const percent = ((currentTotalTravel - min) / (max - min)) * 100;

    return (
        <div className="travel-bar-container">
            <span className="bar-header">Travel Distance</span>
            {/* the ring would sit at the wrong angle until the real range lands, so hold a shimmer */}
            {ready ? (
            <div className="radial-travel-bar">
                <span className="min-travel">{min + " mm"}</span>
                <Progress progress={percent} reduction='.5' hideValue='true'/>
                <span className="max-travel">{max + " mm"}</span>
            </div>
            ) : (
            <div className="radial-travel-bar">
                <span className="skeleton bar-label-skeleton" />
                <span className="skeleton bar-ring-skeleton" />
                <span className="skeleton bar-label-skeleton" />
            </div>
            )}
        </div>
    );
}

export default TravelComparisonBar;
