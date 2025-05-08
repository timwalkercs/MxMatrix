import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import './SwitchDetails.css';

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
                <h1>Switch Details</h1>
                <div className="switch-card">
                    <div className="switch-image">
                        <img src={switchData.imageUrl} alt={switchData.name} />
                    </div>
                    <div className="switch-info">
                        <table className="switch-table">
                            <thead>
                                <tr>                     
                                    <th colSpan="2">{switchData.brand} {switchData.name}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><td>Manufacturer</td><td>{switchData.manufacturer}</td></tr>
                                <tr><td>Type</td><td>{switchData.type}</td></tr>
                                <tr><td>Top Housing</td><td>{switchData.topHousingMaterial}</td></tr>
                                <tr><td>Bottom Housing</td><td>{switchData.bottomHousingMaterial}</td></tr>
                                <tr><td>Stem Material</td><td>{switchData.stemMaterial}</td></tr>
                                <tr><td>Stem Construction</td><td>{switchData.stemConstruction}</td></tr>
                                <tr><td>Spring</td><td>{switchData.springDescription}</td></tr>
                                <tr><td>Mount</td><td>{switchData.mountType}-pin</td></tr>
                                <tr><td>Actuation Force</td><td>{switchData.actuationForce}g</td></tr>
                                <tr><td>Bottom-Out Force</td><td>{switchData.bottomOutForce}g</td></tr>
                                <tr><td>Pre-Travel</td><td>{switchData.preTravel}mm</td></tr>
                                <tr><td>Total Travel</td><td>{switchData.totalTravel}mm</td></tr>
                                <tr><td>Factory Lube</td><td>{switchData.factoryLubed ? 'Yes' : 'No'}</td></tr>
                                <tr><td>Silent</td><td>{switchData.silent ? 'Yes' : 'No'}</td></tr>
                                <tr><td>Descriptors</td><td>{switchData.descriptors.join(', ')}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );



}

export default SwitchDetail;
