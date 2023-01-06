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
    const [isToday, setIsToday] = useState("");
    const [isSelected, setIsSelected] = useState("");
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
          <h2
            onClick={(e) => {
              setIsSelected("Sunday");
            }}
            className="weekday sunday"
          >
            Sunday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Monday");
            }}
            className="weekday monday"
          >
            Monday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Tuesday");
            }}
            className="weekday tuesday"
          >
            Tuesday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Wednesday");
            }}
            className="weekday wednesday"
          >
            Wednesday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Thursday");
            }}
            className="weekday thursday"
          >
            Thursday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Friday");
            }}
            className="weekday friday"
          >
            Friday
          </h2>
          <h2
            onClick={(e) => {
              setIsSelected("Saturday");
            }}
            className="weekday saturday"
          >
            Saturday
          </h2>
        </div>
        <div className="class-wrapper">
          <ShowClasses className="classes-info" />
        
        </div>
      
      </div>
    );

}

export default GroupIndex;