import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchClubs, getClubs } from "../../store/club";
import SingleLocation from "./SingleLocation";
import "./ListOfClubs.css"

const ListOfClubs = () => {
  const clubs = useSelector(getClubs);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchClubs());
  }, [dispatch]);

  return (
    <div className="top-location">
      <ul>
        {clubs?.map((club, idx) => (
          <SingleLocation club={club} key={idx} />
        ))}
      </ul>
    </div>
  );
};

export default ListOfClubs;
