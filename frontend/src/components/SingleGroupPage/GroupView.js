import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import { deleteGroup } from "../../store/group";
import AdminGroupCreate from "../GroupsPage/AdminGroupCreate";
import BookedButton from "./BookedButton";
import "./GroupView.css"


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
    e.stopPropagation();
    setOpenForm(true);
  };

  return (
    <>
      <img src={group.photoUrl} alt="" className="show-image" />
      <div className="group-view-info">
        <p className="group-information group-time">{group.time}</p>
        <h1 className="group-title">{group.name}</h1>
        <p className="group-information group-location">{group.club.location}</p>
        <p className="group-information">All Levels Welcome</p>
        <p className="group-information group-instructor">
          {group.instructorName}
        </p>
        <BookedButton />
        <div className="button-holder">
          {sessionUser && sessionUser.admin && (
            <>
              <button className="admin-edit-button" onClick={handleEdit}>
                Edit
              </button>
              <button className="admin-delete-button" onClick={handleDelete}>
                Delete
              </button>
              <AdminGroupCreate group={group} openForm={openForm} setOpenForm={setOpenForm} />
            </>
          )}
        </div>
      </div>
    </>
  );
};

export default GroupView
