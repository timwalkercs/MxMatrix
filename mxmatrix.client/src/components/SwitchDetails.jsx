import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import './SwitchDetails.css';
import ForceComparisonBar from '../components/ForceComparisonBar';
import TravelComparisonBar from '../components/TravelComparisonBar';
import { FIELDS, hasValue } from './switchFields';
import SwitchImage from './SwitchImage';

function SwitchDetail() {
    const { id } = useParams();
    const [switchData, setSwitchData] = useState(null);

    useEffect(() => {
        fetch(`/api/mxswitch/${id}`)
            .then(res => res.json())
            .then(setSwitchData)
            .catch(err => console.error("Error fetching switch:", err));
    }, [id]);

    if (!switchData) return <p>Loading...</p>;

    return (
        <div>
            <div className="page-container">
                <div className="switch-card">
                    <div className="switch-image">
                        <SwitchImage src={switchData.imageUrl} alt={switchData.name} />
                    </div>
                    <div className="switch-info">
                        <table className="switch-table">
                            <thead>
                                <tr>
                                    <th colSpan="2">{switchData.brand} {switchData.name}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {FIELDS.filter(f => hasValue(f.get(switchData))).map(f => (
                                    <tr key={f.label}>
                                        <td>
                                            {f.tooltip
                                                ? <div className="tooltip">{f.label}<span className="tooltiptext">{f.tooltip}</span></div>
                                                : f.label}
                                        </td>
                                        <td>{f.get(switchData)}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
                {(switchData.bottomOutForce !== null || switchData.totalTravel !== null) && (
                    <div className="comparison-header">
                        <h2>How this switch compares...</h2>
                    </div>
                )}
                <div className="bar-wrapper">
                    {switchData.bottomOutForce !== null && (
                        <ForceComparisonBar currentForce={switchData.bottomOutForce} />
                    )}
                    {switchData.totalTravel !== null && (
                        <TravelComparisonBar currentTotalTravel={switchData.totalTravel} />
                    )}
                </div>
            </div>
        </div>
    );



}

export default SwitchDetail;
