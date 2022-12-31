import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGroups, getGroups } from "../../store/group";
import GroupIndexItem from "./GroupIndexItem";
import './GroupIndex.css'

const GroupIndex = () => {
    const dispatch = useDispatch();
    const groups = useSelector(getGroups)
    const [isToday, setIsToday] = useState();
    const [isSelected, setIsSelected] = useState(false);


    useEffect(() => {
        dispatch(fetchGroups())
    }, [dispatch])

    const ShowClasses = () => {
      <ul>
        {groups?.map((group, idx) =>
          group.dayOfWeek === "Sunday" ? (
            <GroupIndexItem group={group} key={idx} />
          ) : (
            ""
          )
        )}
      </ul>
    }

    return (
      <>
        <h2 className="weekday sunday" onClick={ShowClasses}>
          Sunday 
        </h2>
        <h2 className="weekday monday">
          Monday
        </h2>
        <h2 className="weekday tuesday">
          Tuesday
        </h2>
        <h2 className="weekday wednesday">
          Wednesday
        </h2>
        <h2 className="weekday thursday">
          Thursday
        </h2>
        <h2 className="weekday friday">
          Friday
        </h2>
        <h2 className="weekday saturday">
          Saturday
        </h2>
      </>
    );

}

export default GroupIndex;