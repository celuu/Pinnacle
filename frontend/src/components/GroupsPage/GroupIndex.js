import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGroups, getGroups } from "../../store/group";
import GroupIndexItem from "./GroupIndexItem";

const GroupIndex = () => {
    const dispatch = useDispatch();
    const groups = useSelector(getGroups)

    useEffect(() => {
        dispatch(fetchGroups())
    }, [dispatch])

    return (
      <>
        <ul>
          {groups?.map((group, idx) => 
              <GroupIndexItem group={group} key={idx} />
          )}
        </ul>
      </>
    );

}

export default GroupIndex;