import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect, Link } from "react-router-dom";
import * as sessionActions from "../../store/session";
import './SignupForm.css';


const SignupFormPage = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [username, setUsername] = useState("");
    const [fname, setFName] = useState("")
    const [lname, setLName] = useState("")
    const [password, setPassword] = useState("");
    const [email, setEmail] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [errors, setErrors] = useState([])


    if(sessionUser) return <Redirect to="/" />;

    const handleSubmit = (e) =>{
        e.preventDefault();
        if (password === confirmPassword){
            setErrors([]);
            return dispatch(sessionActions.signUp({fname, lname, email, username, password}))
                .catch(async (res) =>{
                    let data; 
                    try {
                        data = await res.clone().json();
                    } catch {
                        data = await res.text();
                    }
                    if (data?.errors) setErrors(data.errors);
                    else if (data) setErrors([data]);
                    else setErrors([res.statusText]);
                }) 
        }
        return setErrors(['Confirm Password field must be the same as the Password field']);
    }
    
    return (
      <>
        <Link to="/" className="eqx-logo">
          <img
            className="login-logo"
            src="https://assets.cdn-equinox.com/images/equinox-white.svg"
          ></img>
        </Link>
        <h1 className="sign-up-logo">Sign Up</h1>
        <br></br>
        <form className="form" onSubmit={handleSubmit}>
          <label className="inputs">
            Email
            <br></br>
            <input
              className="line"
              type="text"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </label>
          <br />
          <br></br>
          <label className="inputs">
            First Name
            <br></br>
            <input
              className="line"
              type="text"
              value={fname}
              onChange={(e) => setFName(e.target.value)}
              required
            />
          </label>
          <br />
          <br />
          <label className="inputs">
            Last Name
            <br></br>
            <input
              className="line"
              type="text"
              value={lname}
              onChange={(e) => setLName(e.target.value)}
              required
            />
          </label>
          <br></br>
          <br />
          <label className="inputs">
            Username
            <br></br>
            <input
              className="line"
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </label>
          <br></br>
          <br />
          <label className="inputs">
            Password
            <br></br>
            <input
              className="line"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </label>
          <br></br>
          <br />
          <label className="inputs">
            Confirm Password
            <br></br>
            <input
              className="line"
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
          </label>
          <br></br>
          <ul className="errors">
            {errors.map((error) => (
              <li key={error}>{error}</li>
            ))}
          </ul>
          <br />
          <button className="button" type="submit">
            Sign Up
          </button>
        </form>
      </>
    );
}


export default SignupFormPage