import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGroups, getGroups } from "../../store/group";

const GroupIndex = () => {
    const dispatch = useDispatch();
    const groups = useSelector(getGroups)

    useEffect(() => {
        dispatch(fetchGroups())
    }, [dispatch])

    return (
      <>
        <ul>
          {groups?.map((group) => (
            <>
              <h1>{group.name}</h1>
              <h2>{group.instructor_name}</h2>
            </>
          ))}
        </ul>
      </>
    );

}

export default GroupIndex;