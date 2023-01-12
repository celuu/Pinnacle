import React from 'react';
import { NavLink, Link, Redirect, useHistory } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import { useLocation } from 'react-router-dom';
import * as sessionActions from "../../store/session";
import logo from "../../assets/pinnacle-white.svg"
import { BsGithub, BsLinkedin } from "react-icons/bs";

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation();
  const dispatch = useDispatch();
  const history = useHistory();

   const logout = (e) => {
     e.preventDefault();
     dispatch(sessionActions.logout());
     history.push("/");
   };


  let sessionLinks;
  if (location.pathname === "/login" || location.pathname === "/signup") {
    sessionLinks = null;
  } else if (sessionUser) { sessionLinks = (
    <>
      <div className="nav-container">
        <Link to="/">
          <img className="eqx-nav-logo" src={logo}></img>
        </Link>

        <div className="right-nav">
          <a href="https://github.com/celuu" target="_blank" className="github">
            <BsGithub />
          </a>
          <a
            href="https://linkedin.com/in/christineeluu"
            target="_blank"
            className="github"
          >
            <BsLinkedin />
          </a>
          <NavLink to="/clubs" className="top-bar">
            Clubs
          </NavLink>
          <NavLink to="/groups" className="top-bar">
            Classes
          </NavLink>
          <li onClick={logout} className="top-bar">
            Sign&nbsp;out
          </li>
          <ProfileButton user={sessionUser} />
        </div>
      </div>
    </>
  );} else {
    sessionLinks = (
      <>
        <div className="nav-container">
          <Link to="/">
            <img className="eqx-nav-logo" src={logo}></img>
          </Link>

          <div className="right-nav">
            <a
              href="https://github.com/celuu"
              target="_blank"
              className="github"
            >
              <BsGithub />
            </a>
            <a
              href="https://linkedin.com/in/christineeluu"
              target="_blank"
              className="github"
            >
              <BsLinkedin />
            </a>
            <NavLink to="/clubs" className="top-bar">
              Clubs
            </NavLink>
            <NavLink to="/groups" className="top-bar">
              Classes
            </NavLink>
            <NavLink to="/login" className="top-bar">
              Sign&nbsp;in
            </NavLink>
          </div>
        </div>
      </>
    );
  }

  return sessionLinks;
}

export default Navigation;