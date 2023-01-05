import { Link } from "react-router-dom";
import "./GroupIndexItem.css"

const GroupIndexItem = ({group}) => {
    return (
      <li className="class-group">
        <Link to={`/groups/${group.id}`} className="single-class">
          <p className="information">{group.time}</p>
          <h3 className="information">{group.name}</h3>
          <p className="information">
            {group.instructorName} - {group.location}
          </p>
          <hr />
        </Link>
      </li>
    );
}

export default GroupIndexItem;