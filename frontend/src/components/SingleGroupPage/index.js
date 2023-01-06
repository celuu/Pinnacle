import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchGroup, getGroup } from "../../store/group";
import { createReservation, deleteReservation, fetchUserReservationForGroup, getUsersReservationForGroup } from "../../store/reservation";
import { getUsersReviewForGroup, createReview, fetchUserReviewForGroup, editReview, deleteReview } from "../../store/review";
import "./SingleGroupPage.css"
import ReviewButton from "./ReviewButton";


const SingleGroupPage = () => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const group = useSelector(getGroup(groupId));
    const reservation = useSelector(getUsersReservationForGroup(groupId));
    const sessionUser = useSelector(state => state.session.user);
    let [showReviewInput, setShowReviewInput] = useState(false);

    useEffect(() => {
        dispatch(fetchGroup(groupId))
        dispatch(fetchUserReservationForGroup(groupId))
    }, [dispatch, groupId])

    const BookedButton = () => {
        if (!sessionUser) {
            return "Log in to book a class"
        }
        if (reservation){
            return (
              <>
                <button className="book-button" onClick={handleDestroy}>Class Booked</button>
              </>
            ); 
        }
        return (
          <>
            <button className="book-button" onClick={handleCreate}>
              Book Class
            </button>
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

    const RenderReview = () => {
      const reviews = useSelector(getUsersReviewForGroup);

      useEffect(() => {
        dispatch(fetchUserReviewForGroup(groupId));
      }, [dispatch])
      
      return (
        <ul className="review-elements-container">
          <h1 className="review-header">Reviews</h1>
          {reviews?.filter((review) => {
            return review.groupId === parseInt(groupId)
          }).map((review, idx) => (
            <div className="single-review">
              <li className="review-elements">{review?.user?.username} : </li>
              <li className="review-elements" key={idx}>
                {review.summary}
              </li>
              <ReviewButton review={review}/>
            </div>
          ))}
        </ul>
      );
    }

    const ReviewForm = () => {
      const [summary, setSummary] = useState("");
      const handleSubmit = (e) => {
        e.preventDefault();
        dispatch(createReview(groupId, summary));
        setSummary("");
      };
      if (!sessionUser) {
          return null;
      }
      return (
        <div className="review-form">
          <h1 className="review-title">LEAVE A REVIEW</h1>
          <form onSubmit={handleSubmit}>
            <label className="summary">
              <textarea
                className="summary-input"
                onChange={(e) => 
                  setSummary(e.target.value)
                }
                value={summary}
              />
            </label>
            <br />
            <button className="review-form-submit-button">Submit</button>
          </form>
        </div>
      );
    }

    const GroupView = ({group}) => {
        return (
          <>
            <img src={group.photoUrl} alt="" className="show-image" />
            <div className="group-view-info">
              <p className="group-information group-time">{group.time}</p>
              <h1 className="group-title">{group.name}</h1>
              <p className="group-information group-location">{group.location}</p>
              <p className="group-information">All Levels Welcome</p>
              <p className="group-information group-instructor">
                {group.instructorName}
              </p>
              <BookedButton />
            </div>
          </>
        );
    }

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