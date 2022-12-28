import csrfFetch from "./csrf";

const RECEIVE_RESERVATION = "reservations/RECEIVE_RESERVATION";
const REMOVE_RESERVATION = "reservations/REMOVE_RESERVATION";

const receiveReservation = (reservation) => ({
  type: RECEIVE_RESERVATION,
  reservation
});

const removeReservation = (reservationId) => ({
    type: REMOVE_RESERVATION,
    reservationId
})


export const getReservation = (reservationId) => (store) => {
  if (store.reservations) {
    return store.reservations[reservationId];
  } else {
    return null;
  }
};

export const fetchReservation = (reservationId) => async (dispatch) => {
  let res = await csrfFetch(`/api/reservations/${reservationId}`);
  if (res.ok) {
    let reservation = await res.json();
    dispatch(receiveReservation(reservation));
  }
};

export const createReservation = (reservation) => async (dispatch) => {
    let res = await csrfFetch("/api/reservations", {
        method: "POST",
        body: JSON.stringify(reservation),
        headers: {
            "Content-Type": "application/json"
        }
    })
     if (res.ok) {
        let newReservation = await res.json();
        dispatch(receiveReservation(newReservation));
     }
}

export const deleteReservation = (reservationId) => async (dispatch) => {
    let res = await csrfFetch(`/api/reservations/${reservationId}`, {
        method: "DELETE"
    })
    dispatch(removeReservation(reservationId))
}


const reservationReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type){
        case RECEIVE_RESERVATION:
            newState[action.reservation.id] = action.reservation;
            return newState;
        case REMOVE_RESERVATION:
            delete newState[action.reservationId]
            return newState;
        default:
            return state;    
    }
}

export default reservationReducer;
