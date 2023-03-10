import { Link } from "react-router-dom";
import "./GroupIndexItem.css"
import defaultGroupClassImage from "../../assets/group-class.jpg";

const GroupIndexItem = ({group}) => {
  
  return (
    <>
      <Link to={`/groups/${group.id}`} className="single-class">
        <li className="class-group">
          <img
            src={group.photoUrl ? group.photoUrl : defaultGroupClassImage}
            alt=""
            className="single-class-photo"
          />
          <div className="single-class-info">
            <p className="information single-class-time">{group.time}</p>
            <h3 className="information single-class-name">{group.name}</h3>
            <p className="information single-class-instructor">
              {group.instructorName} - <span>{group?.club?.location}</span>
            </p>
          </div>
        </li>
      </Link>
    </>
  );
}

export default GroupIndexItem;