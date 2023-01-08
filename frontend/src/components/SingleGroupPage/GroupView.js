import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import { deleteGroup } from "../../store/group";
import AdminGroupCreate from "../GroupsPage/AdminGroupCreate";
import BookedButton from "./BookedButton";

const GroupView = ({ group }) => {
  const [openForm, setOpenForm] = useState(false);
  const sessionUser = useSelector(store => store.session.user);
  const history = useHistory();
  const dispatch = useDispatch();

  const handleDelete = (e) => {
    e.preventDefault();
    dispatch(deleteGroup(group.id));
    history.push("/groups");
  };

  const handleEdit = (e) => {
    e.preventDefault();
    setOpenForm(true);
  };
  return (
    <>
      <img src={group.photoUrl} alt="" className="show-image" />
      <div className="group-view-info">
        <p className="group-information group-time">{group.time}</p>
        <h1 className="group-title">{group.name}</h1>
        <p className="group-information group-location">{group.location}</p>
        <p className="group-information">All Levels Welcome</p>
        <p className="group-information group-instructor">
          {group.instructorName}
        </p>
        <BookedButton />
        {sessionUser && sessionUser.admin && (<><button onClick={handleEdit}> Edit </button>
        <button onClick={handleDelete}>Delete</button>
        {openForm && <AdminGroupCreate group={group} />}</>)}
      </div>
    </>
  );
};

export default GroupView
