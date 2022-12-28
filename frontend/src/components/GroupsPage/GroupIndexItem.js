import { Link } from "react-router-dom";

const GroupIndexItem = ({group}) => {
    return (
      <li>
        <Link to={`/groups/${group.id}`}>
          <h1>{group.name}</h1>
        </Link>
      </li>
    );
}

export default GroupIndexItem;