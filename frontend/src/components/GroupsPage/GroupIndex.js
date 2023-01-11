import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGroups, getGroups } from "../../store/group";
import GroupIndexItem from "./GroupIndexItem";
import './GroupIndex.css'
import AdminGroupCreate from "./AdminGroupCreate";
import RenderClubs from "../ClubsPage/RenderClubs";

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
    const [isClicked, setIsClicked] = useState(true);
    const [clubLocation, setClubLocation] = useState(
      "Equinox Sports Club San Francisco"
    );
    const [updateLocation, setUpdateLocation] = useState(false)
    const [openForm, setOpenForm] = useState(false)
    const sessionUser = useSelector((state) => state.session.user);

   

    useEffect(() => {
        dispatch(fetchGroups(isSelected))
        setUpdateLocation(true)
    }, [dispatch, isSelected, updateLocation])

    const ShowClasses = () => (
      <>
        {isClicked && (
          <ul className="show-class-info">
            {groups?.map((group, idx) =>
              group.dayOfWeek === isSelected && group?.club?.location === clubLocation ? (
                <GroupIndexItem group={group} key={idx} />
              ) : (
                ""
              )
            )}
          </ul>
        )}
      </>
    );
    console.log (sessionUser, sessionUser.admin)


    return (
      <div className="class-container">
        <h1 className="class-title">CLASSES</h1>
        <div className="add-class-container">
          <RenderClubs setClubLocation={setClubLocation} />
          {sessionUser && sessionUser.admin && (
              <button
                className="add-class-button"
                onClick={(e) => setOpenForm(true)}
              >
                Add Class
              </button>
            )}
        </div>
        <AdminGroupCreate openForm={openForm} setOpenForm={setOpenForm} />
        <div className="weekday-classes">
          {weekday.map((day, idx) => (
            <h2
              key={idx}
              onClick={(e) => {
                setIsSelected(day);
              }}
              className={isSelected === day ? "weekday-selected" : "weekday"}
            >
              {day}
            </h2>
          ))}
        </div>
        <div className="class-wrapper">
          <ShowClasses className="classes-info" />
        </div>
      </div>
    );

}

export default GroupIndex;