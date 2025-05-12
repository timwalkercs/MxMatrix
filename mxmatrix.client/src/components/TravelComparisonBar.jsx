import React, { useEffect, useState } from 'react';
import './TravelComparisonBar.css';

function TravelComparisonBar({ currentTotalTravel }) {
    const [range, setRange] = useState({ min: 0, max: 4 }); // placeholder

    useEffect(() => {
        async function fetchRange() {
            try {
                const response = await fetch('/api/mxswitch/totaltravel-range');
                const data = await response.json();
                setRange({ min: data.min, max: data.max });
            } catch (error) {
                console.error('Failed to fetch total-travel range:', error);
            }
        }

        fetchRange();
    }, []);

    const { min, max } = range;

    // Normalize the current value between 0 and 100 for placement
    const percent = ((currentTotalTravel - min) / (max - min)) * 100;

    return (
        <div className="travel-bar-container">
            <h3>Total Travel</h3>
            <div className="travel-bar">
                <div className="travel-label left">{min}mm</div>
                <div className="travel-line">
                    <div className="travel-center-marker"></div>
                    <div
                        className="travel-marker"
                        style={{ left: `${percent}%` }}
                        title={`${currentTotalTravel}mm`}
                    ></div>
                </div>
                <div className="travel-label right">{max}mm</div>
            </div>
            <p>Standard total-travel is 4mm</p>
        </div>
    );
}

export default TravelComparisonBar;
