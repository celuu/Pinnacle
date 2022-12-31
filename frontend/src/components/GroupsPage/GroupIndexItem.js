import { Link } from "react-router-dom";

const GroupIndexItem = ({group}) => {
    return (
      <li>
        <Link to={`/groups/${group.id}`}>
          <h2>{group.name}</h2>
          <p>{group.location}</p>
          <p>{group.time}</p>
        </Link>
      </li>
    );
}

export default GroupIndexItem;