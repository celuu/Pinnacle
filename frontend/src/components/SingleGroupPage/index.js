import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchGroup, getGroup } from "../../store/group";


const SingleGroupPage = () => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const group = useSelector(getGroup(groupId))

    useEffect(() => {
        dispatch(fetchGroup(groupId))
    }, [dispatch, groupId])

    const GroupView = ({group}) => {
        return(
            <>
                <h1>{group.name}</h1>
                <p>{group.instructorName}</p>
            </>
        )
    }

    return (
      <>
        {!group && <h1>Loading...</h1>}
        {group && <GroupView group={group}/> }
      </>
    );
}

export default SingleGroupPage;