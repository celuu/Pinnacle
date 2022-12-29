import csrfFetch from "./csrf";

const RECEIVE_RESERVATION = "reservations/RECEIVE_RESERVATION";
const REMOVE_RESERVATION = "reservations/REMOVE_RESERVATION";

const receiveReservation = (reservation) => ({
  type: RECEIVE_RESERVATION,
  reservation
});

const removeReservation = (reservation) => ({
    type: REMOVE_RESERVATION,
    reservation
})


export const getUsersReservationForGroup = (groupId) => (store) => {
  if (store.reservations) {
    return store.reservations[groupId];
  } else {
    return null;
  }
};


export const fetchUserReservationForGroup = (groupId) => async (dispatch) => {
  let res = await csrfFetch(`/api/reservations?group_id=${groupId}`);
  if (res.ok) {
    let reservation = await res.json();
    dispatch(receiveReservation(reservation));
  }
};

export const createReservation = (groupId) => async (dispatch) => {
    let res = await csrfFetch("/api/reservations", {
      method: "POST",
      body: JSON.stringify({ groupId }),
      headers: {
        "Content-Type": "application/json",
      },
    });
     if (res.ok) {
        let newReservation = await res.json();
        dispatch(receiveReservation(newReservation));
     }
}

export const deleteReservation = (reservation) => async (dispatch) => {
    let res = await csrfFetch(`/api/reservations/${reservation.id}`, {
        method: "DELETE"
    })
    dispatch(removeReservation(reservation))
}


const reservationReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type){
        case RECEIVE_RESERVATION:
            newState[action.reservation.groupId] = action.reservation;
            return newState;
        case REMOVE_RESERVATION:
            delete newState[action.reservation.groupId]
            return newState;
        default:
            return state;    
    }
}

export default reservationReducer;
