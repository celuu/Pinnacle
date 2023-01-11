import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { login } from "../../store/session";
import { Redirect, Link } from "react-router-dom";
import './LoginForm.css'
import logo from "../../assets/pinnacle-white.svg";


const LoginFormPage = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user)
    const [credential, setCredential] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([])

    if (sessionUser) return <Redirect to='/' />
    
    const handleSubmit = (e) => {
        e.preventDefault();
        createSession(credential, password);
    }

    const createDemoUserSession = () => {
        createSession('Demo-lition', 'password');        
    };

    const createSession = (credential, password) => {
         setErrors([]);
         return dispatch(login({ credential, password })).catch(async (res) => {
           let data;
           try {
             data = await res.clone().json();
           } catch {
             data = await res.text();
           }
           if (data?.errors) setErrors(data.errors);
           else if (data) setErrors([data]);
           else setErrors([res.statusText]);
         });
    }

    return (
      <div className="sign-in-wrapper">
        <div className="sign-in-content">
          <img className="login-logo" src={logo} />
          <form onSubmit={handleSubmit}>
            <h1 className="sign-in">sign in</h1>
            <br></br>
            <label className="credential-label">
              Email
              <br></br>
              <input
                className="line"
                type="text"
                value={credential}
                onChange={(e) => setCredential(e.target.value)}
                required
              />
              <br></br>
            </label>
            <label className="credential-label">
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

            <ul className="errors">
              {errors.map((error) => (
                <li key={error}>{error}</li>
              ))}
            </ul>

            <div className="sign-in-bottom terms">
              <br />
              <br />
              By clicking "Sign in", you agree to our{" "}
              <span className="underline">Terms and Conditions</span> and
              consent to our <span className="underline">Private Policy.</span>
            </div>
            <div className="button-wrapper">
              <button className="button" type="submit">
                Sign in
              </button>
            </div>
          </form>
          <button className="demo" onClick={createDemoUserSession}>
            Login as Demo User
          </button>
          <div className="sign-in-bottom sign-up">
            <Link to="/signup">Create an account</Link>
          </div>
        </div>
      </div>
    );
}



export default LoginFormPage