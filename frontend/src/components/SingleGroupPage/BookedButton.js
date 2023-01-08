import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { createReservation, deleteReservation, getUsersReservationForGroup } from "../../store/reservation";

const BookedButton = () => {
    const sessionUser = useSelector((state) => state.session.user);
    const {groupId} = useParams();
    const reservation = useSelector(getUsersReservationForGroup(groupId));
    const dispatch = useDispatch();

     const handleCreate = (e) => {
       e.preventDefault();
       dispatch(createReservation(groupId));
     };

     const handleDestroy = (e) => {
       e.preventDefault();
       dispatch(deleteReservation(reservation));
     };

    if (!sessionUser) {
        return "Log in to book a class";
    }
    if (reservation) {
        return (
        <>
            <button className="book-button" onClick={handleDestroy}>
            Class Booked
            </button>
        </>
        );
    }
    return (
        <>
        <button className="book-button" onClick={handleCreate}>
            Book Class
        </button>
        </>
    );
};

export default BookedButton;