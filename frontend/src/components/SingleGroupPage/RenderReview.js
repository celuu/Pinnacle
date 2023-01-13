import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchUserReviewForGroup, getUsersReviewForGroup } from "../../store/review";
import ReviewButton from "./ReviewButton";
import "./RenderReview.css"
import { GiWeightLiftingUp } from "react-icons/gi";
import { clearReviews } from "../../store/review";


const RenderReview = () => {
    const reviews = useSelector(getUsersReviewForGroup);
    const dispatch = useDispatch();
    const {groupId} = useParams();

    const colors = [
      "red", "orange", "yellow", "green", "blue", "purple"
    ]

    useEffect(() => {
      dispatch(fetchUserReviewForGroup(groupId));
      return (() => {
        dispatch(clearReviews())
      })
    }, [dispatch]);

    return (
      <ul className="review-elements-container">
        {reviews.length && <h1 className="review-header">Reviews</h1>}
        {reviews
          ?.filter((review) => {
            return review.groupId === parseInt(groupId);
          })
          .reverse()
          .map((review, idx) => (
            <div className="single-review" key={idx}>
              <div className="review-container">
                <li
                  className="review-elements review-name"
                  style={{ color: colors[review.user.id % colors.length] }}
                >
                  <GiWeightLiftingUp />
                  {review?.user?.username}
                </li>
                <li className="review-elements review-summary">
                  {review.summary}
                </li>
              </div>
              <ReviewButton review={review} />
            </div>
          ))}
      </ul>
    );
};

export default RenderReview;