import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { editReview } from "../../store/review";


const EditForm = ({review, setIsEdit}) => {
    const dispatch = useDispatch();
    const [summary, setSummary] = useState(review.summary)

     const handleEdit = (e) => {
       e.preventDefault();
       dispatch(editReview(review));
       setIsEdit(false)
     };

     return (
       <>
         <div className="review-form">
           <h1 className="review-title">EDIT REVIEW</h1>
           <form onSubmit={handleEdit}>
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
       </>
     );


}

export default EditForm;