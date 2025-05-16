import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import './Gallery.css';
import BrandFilterBar from './BrandFilterBar';
import SpecFilterBar from './SpecFilterBar';

function Gallery() {
    const [filtersVisible, setFiltersVisible] = useState(false);
    const [switches, setSwitches] = useState([]);
    const [descriptors, setDescriptors] = useState([]);
    const [filteredSwitches, setFilteredSwitches] = useState([]);
    const [brands, setBrands] = useState([]);
    const [types, setTypes] = useState([]);
    const [topHousings, setTopHousings] = useState([]);
    const [bottomHousings, setBottomHousings] = useState([]);
    const [stemMaterials, setStemMaterials] = useState([]);
    const [filters, setFilters] = useState({
        brand: new Set(),
        topHousing: new Set(),
        bottomHousing: new Set(),
        stemMaterial: new Set(),
        type: new Set(),
        silent: false,
        bottomOutForce: { min: '', max: '' },
        totalTravel: { min: '', max: '' },
        descriptor: new Set(),
        // Add more filters if you want
    });

    useEffect(() => {
        Promise.all([
            fetch('/api/mxswitch').then(response => response.json()),
            fetch('/api/mxswitch/descriptors').then(response => response.json())
        ])
            .then(([data, descData]) => {
                setSwitches(data);
                setFilteredSwitches(data);
                setDescriptors(descData);

                //Set types
                const typeList = ["Linear", "Tactile", "Clicky"];
                setTypes(typeList);

                // Get unique brands
                const brandList = [...new Set(data.map(sw => sw.brand))];
                setBrands(brandList);

                // Get unique top housing materials
                const topHousingList = [...new Set(data.map(sw => sw.topHousingMaterial))];
                setTopHousings(topHousingList);

                // Get unique bottom housing materials
                const bottomHousingList = [...new Set(data.map(sw => sw.bottomHousingMaterial))];
                setBottomHousings(bottomHousingList);

                // Get unique bottom housing materials
                const stemMaterialList = [...new Set(data.map(sw => sw.stemMaterial))];
                setStemMaterials(stemMaterialList);
            })
            .catch(error => console.error('Error fetching switches:', error));

    }, []);


    const handleFilterChange = (filterType, value, isChecked) => {
        const newFilters = { ...filters };

        //Silent filter is not a Set like the other filters
        if (filterType === 'silent') {
            newFilters.silent = isChecked;
        }
        else if (filterType === 'bottomOutForce' || filterType === 'totalTravel') {
            // value should be an object: { min: number|string, max: number|string }
            newFilters[filterType] = value;
        }
        else {
            const updatedSet = new Set(newFilters[filterType]);
            if (isChecked) {
                updatedSet.add(value);
            } else {
                updatedSet.delete(value);
            }
            newFilters[filterType] = updatedSet;
        }

        setFilters(newFilters);


        // Now filter the switches
        let filtered = switches.filter(sw => {
            const brandMatch = newFilters.brand.size === 0 || newFilters.brand.has(sw.brand);
            const topHousingMatch = newFilters.topHousing.size === 0 || newFilters.topHousing.has(sw.topHousingMaterial);
            const bottomHousingMatch = newFilters.bottomHousing.size === 0 || newFilters.bottomHousing.has(sw.bottomHousingMaterial);
            const stemMaterialMatch = newFilters.stemMaterial.size === 0 || newFilters.stemMaterial.has(sw.stemMaterial);
            const typeMatch = newFilters.type.size === 0 || newFilters.type.has(sw.type);
            const silentMatch = !newFilters.silent || sw.silent === true;
            const descMatch = newFilters.descriptor.size === 0 || (sw.descriptors && [...newFilters.descriptor].every(d => sw.descriptors.includes(d)));

            const bof = sw.bottomOutForce ?? 0;
            const tt = sw.totalTravel ?? 0;

            const bottomOutForceMatch =
                (!newFilters.bottomOutForce.min || bof >= parseFloat(newFilters.bottomOutForce.min)) &&
                (!newFilters.bottomOutForce.max || bof <= parseFloat(newFilters.bottomOutForce.max));

            const totalTravelMatch =
                (!newFilters.totalTravel.min || tt >= parseFloat(newFilters.totalTravel.min)) &&
                (!newFilters.totalTravel.max || tt <= parseFloat(newFilters.totalTravel.max));

            return brandMatch && topHousingMatch && bottomHousingMatch && stemMaterialMatch && typeMatch && silentMatch && descMatch && bottomOutForceMatch && totalTravelMatch;
        });

        setFilteredSwitches(filtered);
    };

    return (
        <div className="gallerydiv">
            <h1>Switch Gallery</h1>

            <button
                className="toggle-filters-button"
                onClick={() => setFiltersVisible(prev => !prev)}
            >
                {filtersVisible ? "Hide Filters" : "Show Filters"}
            </button>

            <div className="gallery-layout">
                <div className={`leftfilter ${filtersVisible ? '' : 'hidden-filter'}`}>
                    <BrandFilterBar
                        brands={brands}
                        descriptors={descriptors}
                        onFilterChange={handleFilterChange}
                    />
                </div>



                <div className="grid">
                    {filteredSwitches.map((sw) => (
                        <div key={sw.id} className="card">
                            <Link to={`/switchdetails/${sw.id}`} className="card-link">
                                <img src={sw.imageUrl} alt={sw.name} />
                            </Link>
                            <div className="title">
                                <Link to={`/switchdetails/${sw.id}`} className="card-link">
                                    <p id="brand">{sw.brand}</p>
                                    <p>{sw.name}</p>
                                </Link>
                                <p className="type">{sw.type}</p>
                            </div>

                        </div>
                    ))}
                </div>

                <div className={`rightfilter ${filtersVisible ? '' : 'hidden-filter'}`}>
                    <SpecFilterBar
                        types={types}
                        topHousings={topHousings}
                        bottomHousings={bottomHousings}
                        stemMaterials={stemMaterials}
                        onFilterChange={handleFilterChange}
                        filters={filters}
                    />
                </div>
            </div>
        </div>
    );
}

export default Gallery;
