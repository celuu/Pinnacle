import React from 'react';
import { NavLink, Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <>
        <ProfileButton user={sessionUser} />
        <NavLink to="/groups">Groups</NavLink>
      </>
    );
  } else {
    sessionLinks = (
      <>
        <NavLink to="/login">Log In</NavLink>
        <NavLink to="/groups">Groups</NavLink>
      </>
    );
  }

  return (
    <div className="background">
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