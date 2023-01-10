import { useState } from "react";
import { useDispatch } from "react-redux";
import { editReview } from "../../store/review";
import "./EditForm.css"
import Modal from "react-modal";

const customStyles = {
   content: {
     top: "50%",
     left: "50%",
     right: "auto",
     bottom: "auto",
     height: "300px",
     width: "440px",
     marginRight: "-50%",
     transform: "translate(-50%, -50%)",
     border: "2px",
     borderColor: "#FFFFFF",
     borderRadius: "5px",
     borderStyle: "solid",
     backgroundColor: "#000000",
     overflow: "hidden",
   },
 };

 Modal.setAppElement("#root");

const EditForm = ({review, setIsEdit, isEdit}) => {
    const dispatch = useDispatch();
    const [summary, setSummary] = useState(review.summary)

     const handleEdit = (e) => {
       e.preventDefault();
       const newReview = {...review, summary: summary}
       dispatch(editReview(newReview));
       setIsEdit(false)
     };

     return (
       <Modal
         isOpen={isEdit}
         onRequestClose={() => setIsEdit(false)}
         style={customStyles}
         overlayClassName="Overlay"
         closeTimeoutMS={200}
         contentLabel="admin-class-label"
       >
         <div className="admin-edit-form">
           <h1 className="admin-edit-title">EDIT REVIEW</h1>
           <form onSubmit={handleEdit}>
             <label className="summary">
               <textarea
                 className="summary-input"
                 onChange={(e) => setSummary(e.target.value)}
                 value={summary}
               />
             </label>
             <div className="around-buttons-edit">
               <button
                 className="Admin-group-button"
                 onClick={() => setIsEdit(false)}
               >
                 Back
               </button>
               <button className="Admin-group-button">Submit</button>
             </div>
           </form>
         </div>
       </Modal>
     );


}

export default EditForm;