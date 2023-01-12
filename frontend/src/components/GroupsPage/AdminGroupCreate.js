import { useState } from "react";
import { useDispatch } from "react-redux";
import { createGroup, editGroup } from "../../store/group";
import { useHistory, useParams } from "react-router-dom";
import "./AdminGroupCreate.css"
import Modal from "react-modal";

const customStyles = {
   content: {
     top: "50%",
     left: "50%",
     right: "auto",
     bottom: "auto",
     height: "520px",
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

const AdminGroupCreate = ({group, openForm, setOpenForm}) => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const [name, setName] = useState(group ? group.name : "");
    const [dayOfWeek, setDayOfWeek] = useState(group ? group.dayOfWeek : "")
    const [instructorName, setInstructorName] = useState(group ? group.instructorName : "")
    const [location, setLocation] = useState(group ? group?.club?.location : "") 
    const [time, setTime] = useState(group ? group.time : "")
    const [isEdit, setIsEdit] = useState(group ? true : false)
    const [errors, setErrors] = useState([]);
    const history = useHistory();

    const handleSubmit = (e) => {
        e.preventDefault();
        if (isEdit) {
            const group = {
              name,
              day_of_week: dayOfWeek,
              instructor_name: instructorName,
              location,
              time,
              id: groupId,
            };
            dispatch(editGroup(group))
              .then(() => setOpenForm(false))
              .catch(async (res) => {
                let data;
                try {
                  data = await res.clone().json();
                } catch {
                  data = await res.text();
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
              });            
        } else {
          const group = {
            name,
            day_of_week: dayOfWeek,
            instructor_name: instructorName,
            location,
            time,
          };
          dispatch(createGroup(group)).then(async (newGroup) => {
            history.push(`/groups/${newGroup.id}`);
            setOpenForm(false);
          })
          .catch(async (res) => {
            let data;
            try {
              data = await res.clone().json();
            } catch {
              data = await res.text();
            }
            if (data?.errors) setErrors(data.errors);
            else if (data) setErrors([data]);
            else setErrors([res.statusText]);
          });
        }
    };

    return (
      <Modal
        isOpen={openForm}
        onRequestClose={() => setOpenForm(false)}
        style={customStyles}
        overlayClassName="Overlay"
        closeTimeoutMS={200}
        contentLabel="admin-class-label"
      >
        <form onSubmit={handleSubmit} className="admin-form">
          <h1 className="admin-title">
            {isEdit ? "Update Class" : "Create Class"}
          </h1>
          <ul className="errors">
            {errors.map((error) => (
              <li key={error}>{error}</li>
            ))}
          </ul>
          <label className="admin-information">Name</label>
          <input
            className="text-boxes"
            type="text"
            onChange={(e) => setName(e.target.value)}
            value={name}
          ></input>
          <label className="admin-information">Day of Week</label>
          <input
            className="text-boxes"
            type="text"
            onChange={(e) => setDayOfWeek(e.target.value)}
            value={dayOfWeek}
          ></input>

          <label className="admin-information">Instructor Name</label>
          <input
            className="text-boxes"
            type="text"
            onChange={(e) => setInstructorName(e.target.value)}
            value={instructorName}
          ></input>

          <label className="admin-information">Location</label>
          <input
            className="text-boxes"
            type="text"
            onChange={(e) => setLocation(e.target.value)}
            value={location}
          ></input>

          <label className="admin-information">Time</label>
          <input
            className="text-boxes"
            type="text"
            onChange={(e) => setTime(e.target.value)}
            value={time}
          ></input>

          <div className="around-buttons">
            <button
              className="Admin-group-button"
              onClick={() => setOpenForm(false)}
            >
              Back
            </button>
            <button className="Admin-group-button">
              {isEdit ? "Update Class" : "Create Class"}
            </button>
          </div>
        </form>
      </Modal>
    );
}

export default AdminGroupCreate;