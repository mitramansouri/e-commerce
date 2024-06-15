import React from "react";
import Hero from '../Components/Hero/Hero';
import Popular from "../Components/Popular/Popular";
import Offer from "../Components/Offers/Offer";
//home page
const Shop = () =>{
    return(
        <div>
            <Hero/>
            <Popular/>
            <Offer/>
        </div>
    )
}
export default Shop