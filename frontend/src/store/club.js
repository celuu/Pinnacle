import csrfFetch from "./csrf";

const RECEIVE_CLUB = "clubs/RECEIVE_CLUB";
const RECEIVE_CLUBS = "clubs/RECEIVE_CLUBS";

const receiveClub = (club) => ({
    type: RECEIVE_CLUB,
    club
})

const receiveClubs = (clubs) => ({
    type: RECEIVE_CLUBS,
    clubs
})

export const getClubs = (store) => {
  if (store.clubs) {
    return Object.values(store.clubs);
  } else {
    return [];
  }
};

export const getClub = (clubId) => (store) => {
  if (store.clubs) {
    return store.clubs[clubId];
  } else {
    return null;
  }
};

export const fetchClubs = () => async (dispatch) => {
  let res = await csrfFetch("/api/clubs");
  if (res.ok) {
    let clubs = await res.json();
    dispatch(receiveClubs(clubs));
  }
};

export const fetchClub = (clubId) => async (dispatch) => {
  let res = await csrfFetch(`/api/clubs/${clubId}`);
  if (res.ok) {
    let club = await res.json();
    dispatch(receiveClub(club));
  }
};

const clubReducer = (state = {}, action) => {
  let newState = { ...state };
  switch (action.type) {
    case RECEIVE_CLUB:
      newState[action.club.id] = action.club;
      return newState;
    case RECEIVE_CLUBS:
      return { ...newState, ...action.clubs};
    default:
      return state;
  }
};

export default clubReducer;