import React from 'react';
import './BrandFilterBar.css';
function BrandFilterBar({ brands, descriptors, onFilterChange }) {
    return (
        <div className="filters">

            <h4>Brand</h4>
            <div className="brand-filters">
                {brands.map((brand) => (
                    <label key={brand}>
                        <input
                            type="checkbox"
                            onChange={(e) => onFilterChange('brand', brand, e.target.checked)}
                        />
                        {brand}
                    </label>
                ))}
            </div>

            <h4>Descriptors</h4>
            <div className="descriptor-filters">
                {descriptors.map((descriptor) => (
                    <label key={descriptor.id}>
                        <input
                            type="checkbox"
                            onChange={(e) => onFilterChange('descriptor', descriptor.name, e.target.checked)}
                        />
                        {descriptor.name}
                    </label>
                ))}
            </div>

        </div>
    );
}

export default BrandFilterBar;
