import React from 'react';
import './ProductDisplay.css';
import star_icon from '../Assets/star_icon.png';
import star_dull_icon from '../Assets/star_dull_icon.png';
const ProductDisplay = (props) => {
    const { product } = props;
    return (
        <div className='produuct-display'>
            <div className="product-display-left">
                <div className="product-display-image-list">
                    <img src={product.image} alt="" />
                    <img src={product.image} alt="" />
                    <img src={product.image} alt="" />
                    <img src={product.image} alt="" />
                </div>
                <div className="product-display-image">
                    <img className='product-display-main-img' src={product.image} alt="" />
                </div>
            </div>
            <div className="product-display-right">
                <h1>{product.name}</h1>
                <div className="right-start">
                    <img src={star_icon} alt="" />
                    <img src={star_icon} alt="" />
                    <img src={star_icon} alt="" />
                    <img src={star_icon} alt="" />
                    <img src={star_dull_icon} alt="" />
                    <p>(122)</p>
                </div>
                <div className="right-prices">
                    <div className="right-price-old">
                        ${product.old_price}
                    </div>
                    <div className="right-price-new">
                        ${product.new_price}
                    </div>
                </div>
                <div className="right-description">
                    {product.name}
                </div>
                <div className="right-size">
                    <h1>Select Size</h1>
                    <div className="sizes">
                        <div>S</div>
                        <div>M</div>
                        <div>L</div>
                        <div>XL</div>
                        <div>XXl</div>
                    </div>
                </div>
                <button>ADD TO CART</button>
                <p className='right-category'><span>Category :</span> {product.category}, T-shirt, Crop Top</p>
                <p className='tags'><span>Tags :</span> Modern, Latest</p>
            </div>
        </div>
    )
}

export default ProductDisplay