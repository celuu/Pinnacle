import React from 'react';
import { NavLink, Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import { useLocation } from 'react-router-dom';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation();
  console.log(location)

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <>
        <div className='nav-bar'>
          <NavLink to="/clubs" className="top-bar">
            Clubs
          </NavLink>
          <NavLink to="/memberbenefits" className="top-bar">
            Member Benefits
          </NavLink>
          <NavLink to="/groups" className="group-click top-bar">
            Classes
          </NavLink>
          <NavLink to="training" className="top-bar">
            Training
          </NavLink>
          <ProfileButton user={sessionUser} />
        </div>
      </>
    );
  } else {
    sessionLinks = (
      <>
        <div className="nav-bar">
          <NavLink to="/clubs" className="top-bar">
            Clubs
          </NavLink>
          <NavLink to="/memberbenefits" className="top-bar">
            Member Benefits
          </NavLink>
          <NavLink to="/groups" className="group-click top-bar">
            Classes
          </NavLink>
          <NavLink to="training" className="top-bar">
            Training
          </NavLink>
          <NavLink to="/login" className="login-click top-bar">
            Sign in
          </NavLink>
        </div>
      </>
    );
  }

  return (
    <div className="nav-bar">
      <Link to="/">
        <img
          className="login-logo"
          src="https://assets.cdn-equinox.com/images/equinox-white.svg"
        ></img>
      </Link>
      <ul>
        <li>
          {sessionLinks}
        </li>
      </ul>
    </div>
  );
}

export default Navigation;