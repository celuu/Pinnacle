import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchGroup, getGroup } from "../../store/group";
import { createReservation, deleteReservation, fetchUserReservationForGroup, getUsersReservationForGroup } from "../../store/reservation";
import ReviewForm from "../ReviewForm";

const SingleGroupPage = () => {
    const dispatch = useDispatch();
    const {groupId} = useParams();
    const group = useSelector(getGroup(groupId))
    const reservation = useSelector(getUsersReservationForGroup(groupId))
    const sessionUser = useSelector(state => state.session.user)

    useEffect(() => {
        dispatch(fetchGroup(groupId))
        dispatch(fetchUserReservationForGroup(groupId))
    }, [dispatch, groupId])

    const BookedButton = () => {
        if (!sessionUser) {
            return "Log in to book a class"
        }
        if (reservation){
            return (
              <>
                <button onClick={handleDestroy}>cancel booking</button>
              </>
            ); 
        }
        return (
          <>
            <button onClick={handleCreate}>Book</button>
          </>
        );
    }

    const handleCreate = (e) => {
        e.preventDefault();
        dispatch(createReservation(groupId))
    }

    const handleDestroy = (e) => {
        e.preventDefault();
        dispatch(deleteReservation(reservation))
    }


    const GroupView = ({group}) => {
        return (
          <>
            <h1>{group.name}</h1>
            <p>{group.instructorName}</p>
            <BookedButton />
            <button>Leave a Review
              <ReviewForm />
            </button>
          </>
        );
    }

    return (
      <>
        {!group && <h1>Loading...</h1>}
        {group && <GroupView group={group}/> }
      </>
    );
}

export default SingleGroupPage;