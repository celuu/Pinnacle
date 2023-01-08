import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { createReview } from "../../store/review";


const ReviewForm = () => {
    const [summary, setSummary] = useState("");
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const sessionUser = useSelector((state) => state.session.user);

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
                onChange={(e) => setSummary(e.target.value)}
                value={summary}
            />
            </label>
            <br />
            <button className="review-form-submit-button">Submit</button>
        </form>
        </div>
    );
};

export default ReviewForm;