import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGroups, getGroups } from "../../store/group";
import GroupIndexItem from "./GroupIndexItem";
import './GroupIndex.css'

const weekday = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

const GroupIndex = () => {
    const dispatch = useDispatch();
    const groups = useSelector(getGroups)
    const [isSelected, setIsSelected] = useState(weekday[(new Date()).getDay()]);
    const [isClicked, setIsClicked] = useState(false);
    const [clubLocation, setClubLocation] = useState(
      "Equinox Sports Club San Francisco"
    );
    const [updateLocation, setUpdateLocation] = useState(false)

    useEffect(() => {
        dispatch(fetchGroups())
        setIsClicked(true)
        setUpdateLocation(true)
    }, [dispatch, isSelected, updateLocation])

    const ShowClasses = () => (
      <>
        {isClicked && (
          <ul className="show-class-info">
            {groups?.map((group, idx) =>
              group.dayOfWeek === isSelected && group.location === clubLocation ? (
                <GroupIndexItem group={group} key={idx} />
              ) : (
                ""
              )
            )}
          </ul>
        )}
      </>
    );

    const ShowLocation = () => {
      <>
        <li>Equinox Sports Club San Francisco</li>
        <li>Equinox Pine Street</li>
        <li>Equinox Union Street</li>
        <li>Equinox Beale Street</li>
        <li>Equinox Van Mission</li>
      </>;
    }

    return (
      <div className="class-container">
        <h1 className="class-title">CLASSES</h1>
        <ShowLocation />
        <div className="weekday-classes">
          {weekday.map((day, idx) => 
            <h2 key={idx}
              onClick={(e) => {
                setIsSelected(day);
              }}
              className={isSelected === day ? "weekday-selected" : "weekday"}
            >
              {day}
            </h2>
          )}
        </div>
        <div className="class-wrapper">
          <ShowClasses className="classes-info" />
        
        </div>
      
      </div>
    );

}

export default GroupIndex;