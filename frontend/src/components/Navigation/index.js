import React from 'react';
import { NavLink } from 'react-router-dom';
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
        <NavLink to="/signup">Sign Up</NavLink>
        <NavLink to="/groups">Groups</NavLink>
      </>
    );
  }

  return (
    <div className='background'>
      <ul>
        <li>
          <NavLink exact to="/">
            Home
          </NavLink>
          {sessionLinks}
        </li>
      </ul>
    </div>
  );
}

export default Navigation;