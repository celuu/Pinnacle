import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { editReview, deleteReview } from "../../store/review";
import EditForm from "./EditForm";

const ReviewButton = ({ review }) => {
 
  const sessionUser = useSelector((state) => state.session.user);
  const dispatch = useDispatch();

  const [isEdit, setIsEdit] = useState(false);

 

  const handleReviewDestroy = (e) => {
    e.preventDefault();
    dispatch(deleteReview(review.id));
  };

  if (!sessionUser) {
    return null;
  }
  if (sessionUser.id === review.user.id) {
    return (
      <>
        {isEdit && <EditForm review={review} setIsEdit={setIsEdit}/>}
        <button onClick={(e) => setIsEdit(true)} className="review-edit-button">
          Edit
        </button>
        <button onClick={handleReviewDestroy} className="review-delete-button">
          Delete
        </button>
      </>
    );
  }
};

export default ReviewButton;
