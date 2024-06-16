import React from "react";
import Hero from '../Components/Hero/Hero';
import Popular from "../Components/Popular/Popular";
import Offer from "../Components/Offers/Offer";
import NewCollection from "../Components/NewCollection/NewCollection";
import Newsletter from "../Components/NewsLetter/Newsletter";
//home page
const Shop = () =>{
    return(
        <div>
            <Hero/>
            <Popular/>
            <Offer/>
            <NewCollection/>
            <Newsletter/>
        </div>
    )
}
export default Shop