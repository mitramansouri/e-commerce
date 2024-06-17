import React, { useContext } from "react";
import { ShopContext } from '../Context/ShopContext.jsx';
import { useParams } from "react-router-dom";
import Breadcrum from "../Components/Breadcrums/Breadcrum.jsx";
import ProductDisplay from "../Components/ProductDisplay/ProductDisplay.jsx";

const Product = () =>{
    const {all_product} = useContext(ShopContext);
    const {productID} = useParams();
    const product =all_product.find((e)=>e.id === Number(productID));
    return(
        <div>
            <Breadcrum product={product}/>
            <ProductDisplay product={product}/>
        </div>
    )
}
export default Product