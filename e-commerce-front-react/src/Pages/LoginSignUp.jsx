import React from "react";
import './CSS/LoginSignup.css'

const LoginSignUp = () =>{
    return(
        <div className="loginSignup">
            <div className="loginSignup-container">
                <h1>Sign Up</h1>
                <div className="loginSignup-fields">
                    <input type="text" placeholder="Your Name" />
                    <input type="emial"  placeholder="Email adress"/>
                    <input type="password" placeholder="Password" />
                </div>
                <button>
                    Continue
                </button>
                <p className="loginSignup-login">
                    Already have an account? <span>Login here</span>
                </p>
                <div className="loginSignup-agree">
                    <input type="checkbox" name="" id="" />
                    <p>By continuing, i agree to choose the terms of use and priavacy and policy.</p>
                </div>
            </div>
        </div>
    )
}
export default LoginSignUp