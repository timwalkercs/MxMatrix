import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import './SwitchDetails.css';
import ForceComparisonBar from '../components/ForceComparisonBar';
import TravelComparisonBar from '../components/TravelComparisonBar';
import { FIELDS, hasValue } from './switchFields';
import SwitchImage from './SwitchImage';
import SimilarSwitches from './SimilarSwitches';

function SwitchDetail() {
    const { id } = useParams();
    const [switchData, setSwitchData] = useState(null);
    const [failed, setFailed] = useState(false);

    useEffect(() => {
        fetch(`/api/mxswitch/${id}`)
            .then(res => res.json())
            .then(setSwitchData)
            .catch(err => {
                console.error("Error fetching switch:", err);
                setFailed(true);
            });
    }, [id]);

    if (failed) return (
        <div className="page-container">
            <p>That switch could not be loaded. Please try again.</p>
        </div>
    );

    // stand-in for the card's two halves, so the page keeps its shape while the switch loads
    if (!switchData) return (
        <div className="page-container">
            <div className="switch-card">
                <div className="switch-image">
                    <div className="skeleton detail-image-skeleton" />
                </div>
                <div className="switch-info">
                    <div className="detail-table-skeleton">
                        {Array.from({ length: 9 }, (_, i) => (
                            <div key={`detail-skeleton-${i}`} className="skeleton" />
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );

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

                <div className="bar-wrapper">
                    {switchData.bottomOutForce !== null && (
                        <ForceComparisonBar currentForce={switchData.bottomOutForce} />
                    )}
                    {switchData.totalTravel !== null && (
                        <TravelComparisonBar currentTotalTravel={switchData.totalTravel} />
                    )}
                </div>
                <SimilarSwitches current={switchData} />
            </div>
        </div>
    );



}

export default SwitchDetail;
