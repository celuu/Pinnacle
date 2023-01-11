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
    <ul className="single-club-container">
      {clubs?.map((club, idx) => (
        <SingleLocation club={club} key={idx} />
      ))}
    </ul>
  );
};

export default ListOfClubs;
