import React from 'react'
import './Newsletter.css'

const Newsletter = () => {
  return (
    <div className='newsletter'>
        <h1>Get Exclusive offers On your Email</h1>
        <p>Subscribe to your newsletter and stay updated</p>
        <div>
            <input type="email" placeholder='Your email Id' />
            <button>Subsrcibe</button>
        </div>
    </div>
  )
}

export default Newsletter