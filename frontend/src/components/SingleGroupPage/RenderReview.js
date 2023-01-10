import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchUserReviewForGroup, getUsersReviewForGroup } from "../../store/review";
import ReviewButton from "./ReviewButton";
import "./RenderReview.css"


const RenderReview = () => {
    const reviews = useSelector(getUsersReviewForGroup);
    const dispatch = useDispatch();
    const {groupId} = useParams();

    useEffect(() => {
    dispatch(fetchUserReviewForGroup(groupId));
    }, [dispatch]);

    return (
      <ul className="review-elements-container">
        {reviews.length && <h1 className="review-header">Reviews</h1>}
        {reviews
          ?.filter((review) => {
            return review.groupId === parseInt(groupId);
          })
          .map((review, idx) => (
            <div className="single-review" key={idx}>
              <div className="review-container">
                <li className="review-elements review-name">
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