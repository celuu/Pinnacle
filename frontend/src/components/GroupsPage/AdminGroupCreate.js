import { useState } from "react";
import { useDispatch } from "react-redux";
import { createGroup } from "../../store/group";


const AdminGroupCreate = ({group}) => {
    const dispatch = useDispatch();
    const [name, setName] = useState("");
    const [dayOfWeek, setDayOfWeek] = useState("")
    const [instructorName, setInstructorName] = useState("")
    const [location, setLocation] = useState("")
    const [time, setTime] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault();
        dispatch(createGroup(group))
    };

    return (
      <>
        <form onSubmit={handleSubmit}>
          <label>
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
            Name:
            <input
              type="text"
              onChange={(e) => setTime(e.target.value)}
              value={time}
            ></input>
          </label>
        </form>
      </>
    );
}

export default AdminGroupCreate;