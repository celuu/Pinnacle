import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchClubs, getClubs } from "../../store/club";
import SingleClub from "./SingleClub";

const ShowClubs = ({setClubLocation, setFilterClicked}) => {
  const clubs = useSelector(getClubs);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchClubs());
  }, [dispatch]);
 
  return (
    <ul className="dropdown">
      {clubs?.map((club, idx) => (
        <SingleClub club={club} key={idx} setClubLocation={setClubLocation} />
      ))}
    </ul>
  );
};


export default ShowClubs;