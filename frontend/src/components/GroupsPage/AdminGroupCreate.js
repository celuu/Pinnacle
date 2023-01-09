import { useState } from "react";
import { useDispatch } from "react-redux";
import { createGroup, editGroup } from "../../store/group";
import { useParams } from "react-router-dom";
import "./AdminGroupCreate.css"
import Modal from "react-modal";

const customStyles = {
   content: {
     top: "50%",
     left: "50%",
     right: "auto",
     bottom: "auto",
     height: "200px",
     width: "440px",
     marginRight: "-50%",
     transform: "translate(-50%, -50%)",
     border: "none",
     borderRadius: "5px",
     backgroundColor: "#FFF",
     overflow: "hidden",
   },
 };

 Modal.setAppElement("#root");


const AdminGroupCreate = ({group, openForm, setOpenForm}) => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const [name, setName] = useState(group ? group.name : "");
    const [dayOfWeek, setDayOfWeek] = useState(group ? group.dayOfWeek : "")
    const [instructorName, setInstructorName] = useState(group ? group.instructorName : "")
    const [location, setLocation] = useState(group ? group.location : "")
    const [time, setTime] = useState(group ? group.time : "")
    const [isEdit, setIsEdit] = useState(group ? true : false)

    const handleSubmit = (e) => {
        e.preventDefault();
        if (isEdit) {
            const group = {name, dayOfWeek, instructorName, location, time, id: groupId}
            dispatch(editGroup(group))
        } else {
            const group = {name, dayOfWeek, instructorName, location, time}
            dispatch(createGroup(group));
        }
    };

    return (
      <Modal
        isOpen={openForm}
        onRequestClose={() => setOpenForm(false)}
        style={customStyles}
        closeTimeoutMS={200}
      >
        <h1>{isEdit ? "Update Class" : "Create Class"}</h1>

        <form onSubmit={handleSubmit}>
          <label className="information">
            Name
            <input
              type="text"
              onChange={(e) => setName(e.target.value)}
              value={name}
            ></input>
          </label>
          <label>
            Day of Week
            <input
              type="text"
              onChange={(e) => setDayOfWeek(e.target.value)}
              value={dayOfWeek}
            ></input>
          </label>
          <label>
            Instructor Name
            <input
              type="text"
              onChange={(e) => setInstructorName(e.target.value)}
              value={instructorName}
            ></input>
          </label>
          <label>
            Location
            <input
              type="text"
              onChange={(e) => setLocation(e.target.value)}
              value={location}
            ></input>
          </label>
          <label>
            Time
            <input
              type="text"
              onChange={(e) => setTime(e.target.value)}
              value={time}
            ></input>
          </label>
          <button onClick={() => setOpenForm(false)}>Back</button>
          <button className="Admin-group-button">
            {isEdit ? "Update Class" : "Create Class"}
          </button>
        </form>
      </Modal>
    );
}

export default AdminGroupCreate;