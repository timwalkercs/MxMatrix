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
                                <tr>
                                    <td>Manufacturer</td>
                                    <td>{switchData.manufacturer}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Type
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                <strong>Linear</strong> switches provide a smooth keystroke. <br></br><br></br> <strong>Tactile</strong> switches differ from linear switches in that there is a noticeable "bump" in the keystroke, often at the actuation point. <br></br><br></br> <strong>Clicky</strong> switches have the same tactile bump, but also have a distinct, audible, click that comes from an additional mechanism not present in linears/tactiles.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{switchData.type}</td>
                                </tr>
                                <tr>
                                    <td>Top Housing</td>
                                    <td>{switchData.topHousingMaterial}</td>
                                </tr>
                                <tr>
                                    <td>Bottom Housing</td>
                                    <td>{switchData.bottomHousingMaterial}</td>
                                </tr>
                                <tr>
                                    <td>Stem Material</td>
                                    <td>{switchData.stemMaterial}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Stem Construction
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                Some stems are made with an enclosure around them that minimizes stem-wobble, increases grip on the keycaps, and prevents dust from getting inside the mechanism.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{switchData.stemConstruction}</td>
                                </tr>
                                <tr>
                                    <td>Spring</td>
                                    <td>{switchData.springDescription}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Mount Type
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                3-pin switches offer the most compatibility with keyboard PCBs while 5-pin switches allow for the most secure mounting experience. If your PCB only has 3 pin slots, clipping the additional plastic pins on 5-pin switches is a simple workaround.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{switchData.mountType+'-pin'}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Actuation Force
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                The force required to actuate the switch. This is affected by the spring which can vary in length, weight, and number of stages.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{(switchData.actuationForce != null) ? switchData.actuationForce + 'g' : ''}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Bottom-Out Force
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                The force required to bottom-out the switch. Some people prefer heavier spring weights to prevent bottoming out for a 'floaty' typing feel.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{(switchData.bottomOutForce != null) ? switchData.bottomOutForce + 'g' : ''}</td>
                                </tr>
                                <tr>
                                    <td>
                                        Pre-Travel
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                The distance the stem needs to travel in order for the switch to actuate. A lower number typically means quicker response time.
                                            </span>
                                        </div>
                                    </td>
                                    <td>{(switchData.preTravel != null) ? switchData.preTravel+'mm' : ''}</td>

                                </tr>
                                <tr>
                                    <td>
                                        Total Travel
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                The total distance the stem travels before it bottoms out. Stems with longer poles and switches with dampeners often have a shorter total travel. Bottoming out on the pole, with no dampeners, creates a sharper typing feel leads to a clackier sound profile. <br></br><br></br><i>The standard total travel distance is 4.0mm.</i>
                                            </span>
                                        </div>
                                    </td>
                                    <td>{(switchData.totalTravel != null) ? switchData.totalTravel + 'mm' : ''}</td>
                                </tr>
                                <tr>
                                    <td>Factory Lube</td>
                                    <td>{switchData.factoryLubed ? 'Yes' : 'No'}</td>
                                </tr>
                                <tr>
                                    <td>Silent
                                        <div class="tooltip">
                                            &#x1F6C8;
                                            <span class="tooltiptext">
                                                Silent switches achieve their quiet operation by utilizing dampening materials like rubber or silicone to absorb the vibrations and reduce the sound of keystrokes. This is primarily done by adding dampeners on the switch stem, rails, or housings. <br></br><br></br><i>These dampeners can shorten travel distance and create a 'mushy' feel.</i>
                                            </span>
                                        </div>
                                    </td>
                                    <td>{switchData.silent ? 'Yes' : 'No'}</td>
                                </tr>
                                <tr>
                                    <td>Descriptors</td>
                                    <td>{switchData.descriptors.join(', ')}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );



}

export default SwitchDetail;
