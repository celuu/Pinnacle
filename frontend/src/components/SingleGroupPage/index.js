import { useEffect} from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchGroup, getGroup } from "../../store/group";
import "./SingleGroupPage.css"
import GroupView from "./GroupView";
import ReviewForm from "./ReviewForm";
import RenderReview from "./RenderReview";
import { fetchUserReservationForGroup } from "../../store/reservation";
import { getUsersReviewForGroup } from "../../store/review";

const SingleGroupPage = () => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const group = useSelector(getGroup(groupId));
    
    useEffect(() => {
        dispatch(fetchGroup(groupId))
        dispatch(fetchUserReservationForGroup(groupId))
    }, [dispatch, groupId])
    
    return (
      <>
        {!group && <h1>Loading...</h1>}
        {group && <GroupView group={group} />}
        <ReviewForm />
        <RenderReview />
      </>
    );
}

export default SingleGroupPage;