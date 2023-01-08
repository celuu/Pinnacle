import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchUserReviewForGroup, getUsersReviewForGroup } from "../../store/review";
import ReviewButton from "./ReviewButton";


const RenderReview = () => {
    const reviews = useSelector(getUsersReviewForGroup);
    const dispatch = useDispatch();
    const {groupId} = useParams();

    useEffect(() => {
    dispatch(fetchUserReviewForGroup(groupId));
    }, [dispatch]);

    return (
    <ul className="review-elements-container">
        
        {reviews
        ?.filter((review) => {
            <h1 className="review-header">Reviews</h1>;
            return review.groupId === parseInt(groupId);
        })
        .map((review, idx) => (
            <div className="single-review">
            <li className="review-elements">{review?.user?.username} : </li>
            <li className="review-elements" key={idx}>
                {review.summary}
            </li>
            <ReviewButton review={review} />
            </div>
        ))}
    </ul>
    );
};

export default RenderReview;