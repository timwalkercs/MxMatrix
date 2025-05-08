import React from 'react';
import './BrandFilterBar.css';
function BrandFilterBar({ brands, descriptors, onFilterChange }) {
    return (
        <div className="filters">

            <h3>Filters</h3>
            
            <h4>Brand</h4>
            {brands.map((brand) => (
                <label key={brand}>
                    <input
                        type="checkbox"
                        onChange={(e) => onFilterChange('brand', brand, e.target.checked)}
                    />
                    {brand}
                </label>
            ))}

            <h4>Descriptors</h4>
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
    );
}

export default BrandFilterBar;
