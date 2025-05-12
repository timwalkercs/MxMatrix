import React, { useEffect, useState } from 'react';
import './ForceComparisonBar.css';

function ForceComparisonBar({ currentForce }) {
    const [range, setRange] = useState({ min: 0, max: 100 }); // placeholder

    useEffect(() => {
        async function fetchRange() {
            try {
                const response = await fetch('/api/mxswitch/bottomout-range');
                const data = await response.json();
                setRange({ min: data.min, max: data.max });
            } catch (error) {
                console.error('Failed to fetch force range:', error);
            }
        }

        fetchRange();
    }, []);

    const { min, max } = range;

    // Normalize the current value between 0 and 100 for placement
    const percent = ((currentForce - min) / (max - min)) * 100;

    return (
        <div className="force-bar-container">
            <h2>How this switch compares...</h2>
            <h3>Bottom-Out Force</h3>
            <div className="force-bar">
                <div className="force-label left">{min}g</div>
                <div className="force-line">
                    <div className="force-center-marker"></div>
                    <div
                        className="force-marker"
                        style={{ left: `${percent}%` }}
                        title={`${currentForce}g`}
                    ></div>
                </div>
                <div className="force-label right">{max}g</div>
            </div>
        </div>
    );
}

export default ForceComparisonBar;
