import React from 'react';
import { NavLink, Link } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import { useLocation } from 'react-router-dom';
import * as sessionActions from "../../store/session";

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation();
  const dispatch = useDispatch();

   const logout = (e) => {
     e.preventDefault();
     dispatch(sessionActions.logout());
   };


  let sessionLinks;
  if (location.pathname === "/login" || location.pathname === "/signup") {
    sessionLinks = null;
  } else if (sessionUser) { sessionLinks = (
    <>
      <div className="nav-container">
        <Link to="/">
          <img className='eqx-nav-logo' src="https://assets.cdn-equinox.com/images/equinox-white.svg"></img>
        </Link>

        <div className="right-nav">
          <NavLink to="/clubs" className="top-bar">
            Clubs
          </NavLink>
          <NavLink to="/groups" className="top-bar">
            Classes
          </NavLink>
          <li onClick={logout} className="top-bar">
            Sign out
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
            <img
              className="eqx-nav-logo"
              src="https://assets.cdn-equinox.com/images/equinox-white.svg"
            ></img>
          </Link>

          <div className="right-nav">
            <NavLink to="/clubs" className="top-bar">
              Clubs
            </NavLink>
            <NavLink to="/groups" className="top-bar">
              Classes
            </NavLink>
            <NavLink to="/login" className="top-bar">
              Sign in
            </NavLink>
          </div>
        </div>
      </>
    );
  }

  return sessionLinks;
}

export default Navigation;