import React from 'react';
import { useState, useEffect, useRef } from 'react';
import './SpecFilterBar.css';
function SpecFilterBar({ topHousings, bottomHousings, stemMaterials, types, onFilterChange, filters }) {

    const [isOpen, setIsOpen] = useState(false);
    const dropdownRef = useRef(null);

    useEffect(() => {
        function handleClickOutside(event) {
            if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
                setIsOpen(false);
            }
        }

        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);



    return (
        <div className="rightfilters">

            <h3>Switch Specs</h3>

            <h4>Type</h4>
            {types.map((type) => (
                <label key={type}>
                    {type}
                    <input
                        type="checkbox"
                        onChange={(e) => onFilterChange('type', type, e.target.checked)}
                    />
                </label>
            ))}


            <h4>Silent</h4>
            <label key='Silent'>
                Yes
                <input
                    type="checkbox"
                    onChange={(e) => onFilterChange('silent', true, e.target.checked)}
                />
            </label>


            <div className="dropdown" ref={dropdownRef}>

                { /* Toggle Area for the Material Dropdown Menu */ }
                <div className="dropdown-toggle" onClick={() => setIsOpen(!isOpen)}>

                    <h4>
                        Materials
                    </h4>
                        
                    {!isOpen && (
                        <p className="expandcollapse">(expand)</p>
                    )}
                    {isOpen && (
                        <p className="expandcollapse">(collapse)</p>
                    )}  

                </div>



                {isOpen && (

                    <div className="dropdown-menu">

                        <div>
                            <h4>Top Housing</h4>
                            {topHousings.map((topHousing) => (
                                <label key={topHousing}>
                                    {topHousing}
                                    <input
                                        type="checkbox"
                                        checked={filters.topHousing.has(topHousing)} //Preserve the checkedboxes on menu open/close
                                        onChange={(e) =>
                                            onFilterChange('topHousing', topHousing, e.target.checked)
                                        }
                                    />
                                </label>
                            ))}
                        </div>

                        <div>
                            <h4>Bottom Housing</h4>
                            {bottomHousings.map((bottomHousing) => (
                                <label key={bottomHousing}>
                                    {bottomHousing}
                                    <input
                                        type="checkbox"
                                        checked={filters.bottomHousing.has(bottomHousing)}
                                        onChange={(e) =>
                                            onFilterChange('bottomHousing', bottomHousing, e.target.checked)
                                        }
                                    />
                                </label>
                            ))}
                        </div>

                        <div>
                            <h4>Stem</h4>
                            {stemMaterials.map((stemMaterial) => (
                                <label key={stemMaterial}>
                                    {stemMaterial}
                                    <input
                                        type="checkbox"
                                        checked={filters.stemMaterial.has(stemMaterial)}
                                        onChange={(e) =>
                                            onFilterChange('stemMaterial', stemMaterial, e.target.checked)
                                        }
                                    />
                                </label>
                            ))}
                        </div>

                    </div>

                )}

            </div>

            <div className="range-filter">
                <h4>Bottom Out Force (g)</h4>
                <div className="range-inputs">
                    <input
                        type="number"
                        min="0"
                        max="200"
                        placeholder="Min"
                        value={filters.bottomOutForce.min}
                        onChange={(e) =>
                            onFilterChange('bottomOutForce', {
                                ...filters.bottomOutForce,
                                min: e.target.value === '' ? '' : parseInt(e.target.value),
                            })
                        }
                    />
                    <span>to</span>
                    <input
                        type="number"
                        min="0"
                        max="200"
                        placeholder="Max"
                        value={filters.bottomOutForce.max}
                        onChange={(e) =>
                            onFilterChange('bottomOutForce', {
                                ...filters.bottomOutForce,
                                max: e.target.value === '' ? '' : parseInt(e.target.value),
                            })
                        }
                    />
                </div>

                <h4>Total Travel (mm)</h4>
                <div className="range-inputs">
                    <input
                        type="number"
                        step="0.1"
                        min="0"
                        max="4"
                        placeholder="Min"
                        value={filters.totalTravel.min}
                        onChange={(e) =>
                            onFilterChange('totalTravel', {
                                ...filters.totalTravel,
                                min: e.target.value === '' ? '' : parseFloat(e.target.value),
                            })
                        }
                    />
                    <span>to</span>
                    <input
                        type="number"
                        step="0.1"
                        min="0"
                        max="4"
                        placeholder="Max"
                        value={filters.totalTravel.max}
                        onChange={(e) =>
                            onFilterChange('totalTravel', {
                                ...filters.totalTravel,
                                max: e.target.value === '' ? '' : parseFloat(e.target.value),
                            })
                        }
                    />
                </div>
            </div>

        </div>




    );
}

export default SpecFilterBar;
