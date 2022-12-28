import csrfFetch from "./csrf";

const RECEIVE_GROUPS = "groups/RECEIVE_GROUPS";
const RECEIVE_GROUP = "groups/RECEIVE_GROUP";

const receiveGroups = (groups) => ({
  type: RECEIVE_GROUPS,
  groups
});

const receiveGroup = (group) => ({
  type: RECEIVE_GROUP,
  group
});

//SELECTORS

export const getGroups = (store) => {
  if (store.groups) {
    return Object.values(store.groups)
  } else {
    return []
  }
}

export const getGroup = (groupId) => (store) => {
  if (store.groups){
    return store.groups[groupId]
  } else {
    return null
  }
}

export const fetchGroups = () => async (dispatch) => {
  let res = await csrfFetch("/api/groups");
  if (res.ok) {
    let groups = await res.json();
    dispatch(receiveGroups(groups));
  }
};

export const fetchGroup = (groupId) => async (dispatch) => {
    let res = await csrfFetch(`/api/groups/${groupId}`);
    if (res.ok){
        let group = await res.json();
        dispatch(receiveGroup(group));
    }
}

const groupReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type) {
        case RECEIVE_GROUPS:
            console.log(action.groups);
            return { ...newState, ...action.groups };
        case RECEIVE_GROUP:
            newState[action.group.id] = action.group;
            return newState;
        default:
            return state; 
    }
};

export default groupReducer;



 

