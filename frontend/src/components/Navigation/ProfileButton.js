import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import "./ProfileButton.css"

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  
  const openMenu = () => {
    if (showMenu) return;
    setShowMenu(true);
  };
  
  useEffect(() => {
    if (!showMenu) return;

    const closeMenu = () => {
      setShowMenu(false);
    };

    document.addEventListener('click', closeMenu);
  
    return () => document.removeEventListener("click", closeMenu);
  }, [showMenu]);

  


  return (
    <>
      <div className={`container ${showMenu && "change"}`} onClick={openMenu}>
        <div className="bar1"></div>
        <div className="bar2"></div>
      </div>
      {showMenu && (
        <ul className="profile-dropdown">
        </ul>
      )}
    </>
  );
}

export default ProfileButton;