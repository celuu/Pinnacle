import csrfFetch from "./csrf";

const RECEIVE_GROUPS = "groups/RECEIVE_GROUPS";
const RECEIVE_GROUP = "groups/RECEIVE_GROUP";
const REMOVE_GROUP = "groups/REMOVE_GROUP";

const receiveGroups = (groups) => ({
  type: RECEIVE_GROUPS,
  groups
});

const receiveGroup = (group) => ({
  type: RECEIVE_GROUP,
  group
});

const removeGroup = (groupId) => ({
  type: REMOVE_GROUP,
  groupId
})

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

export const createGroup = (group) => async (dispatch) => {
  let res = await csrfFetch("/api/groups", {
    method: "POST",
    body: JSON.stringify(group),
    headers: {
      "Content-Type": "application/json",
    },
  });
  if (res.ok) {
    let newGroup = await res.json();
    dispatch(receiveGroup(newGroup));
  }
};

export const editGroup = (group) => async (dispatch) => {
  let res = await csrfFetch(`/api/groups/${group.id}`, {
    method: "PATCH",
    body: JSON.stringify(group),
    headers: {
      "Content-Type": "application/json",
    },
  });
  if (res.ok) {
    let editedGroup = await res.json();
    dispatch(receiveGroup(editedGroup));
  }
};

export const deleteGroup = (groupId) => async (dispatch) => {
  let res = await csrfFetch(`/api/groups/${groupId}`, {
    method: "DELETE",
  });
  dispatch(removeGroup(groupId));
};


const groupReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type) {
        case RECEIVE_GROUPS: //reconsider changing this
            return { ...newState, ...action.groups };
        case RECEIVE_GROUP:
            newState[action.group.id] = action.group;
            return newState;
        case REMOVE_GROUP:
          delete newState[action.groupId];
          return newState;    
        default:
            return state; 
    }
};

export default groupReducer;



 

