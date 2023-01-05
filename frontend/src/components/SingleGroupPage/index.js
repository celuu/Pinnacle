import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchGroup, getGroup } from "../../store/group";
import { createReservation, deleteReservation, fetchUserReservationForGroup, getUsersReservationForGroup } from "../../store/reservation";
import { getUsersReviewForGroup, createReview, fetchUserReviewForGroup } from "../../store/review";
import "./SingleGroupPage.css"


const SingleGroupPage = () => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const group = useSelector(getGroup(groupId));
    const reservation = useSelector(getUsersReservationForGroup(groupId))
    const sessionUser = useSelector(state => state.session.user)
    let [showReviewInput, setShowReviewInput] = useState(false);
    const [summary, setSummary] = useState("")
    const review = useSelector(getUsersReviewForGroup(groupId))

    useEffect(() => {
        dispatch(fetchGroup(groupId))
        dispatch(fetchUserReservationForGroup(groupId))
        dispatch(fetchUserReviewForGroup(groupId));
    }, [dispatch, groupId])

    const BookedButton = () => {
        if (!sessionUser) {
            return "Log in to book a class"
        }
        if (reservation){
            return (
              <>
                <button onClick={handleDestroy}>cancel booking</button>
              </>
            ); 
        }
        return (
          <>
            <button onClick={handleCreate}>Book</button>
          </>
        );
    }

    const handleCreate = (e) => {
        e.preventDefault();
        dispatch(createReservation(groupId))
    }

    const handleDestroy = (e) => {
        e.preventDefault();
        dispatch(deleteReservation(reservation))
    }

    const handleSubmit = (e) => {
      e.preventDefault();
      dispatch(createReview(groupId))
    }

    const RenderReview = ({group}) => {
      return(
        <>
        <ul>
          {review?.map((review, idx) => {
            <p>{review.summary}</p>
          })}
        </ul>
        </>
      )

    }

    const ReviewForm = () => {
      return(
        <>
          <h1>Review</h1>
          <form onSubmit={handleSubmit}>
            <label>Summary
              <textarea onChange={(e) => (setSummary(e.target.value))} value={summary}></textarea>
            </label>
            <button className="review-form-submit-button">Submit</button>
          </form>
        </>
      )
    }

    const GroupView = ({group}) => {
        return (
          <>
            <div className="group-view-info">
              <h1>{group.name}</h1>
              <p>{group.instructorName}</p>
              <BookedButton />
            </div>
          </>
        );
    }

    return (
      <>
        {!group && <h1>Loading...</h1>}
        {group && <GroupView group={group}/> }
        <ReviewForm />
        <RenderReview />
      </>
    );
}

export default SingleGroupPage;