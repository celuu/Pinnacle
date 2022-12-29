import csrfFetch from "./csrf";


const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";
const RECEIVE_REVIEW = "reviews/RECEIVE_REVIEW";
const REMOVE_REVIEW = "reviews/REMOVE_REVIEW";
const UPDATE_REVIEW = "reviews/UPDATE_REVIEW";

const receiveReview = (review) => ({
  type: RECEIVE_REVIEW,
  review,
});

const removeReview = (review) => ({
    type: REMOVE_REVIEW,
    review
})

const updateReview = (review) => ({
    type: UPDATE_REVIEW,
    review
})

const receiveReviews = (review) => ({
    type: RECEIVE_REVIEWS,
    review
})

export const getUsersReviewForGroup = (groupId) => (store) => {
    if (store.reviews) {
        return store.reviews[groupId];
    } else {
        return null;
    }
}

export const createReview = (groupId) => async(dispatch) => {
    let res = await csrfFetch("/api/reviews", {
      method: "POST",
      body: JSON.stringify({ groupId }),
      headers: {
        "Content-Type": "application/json",
      },
    });
     if (res.ok) {
        let newReview = await res.json();
        dispatch(receiveReview(newReview));
     }
}

export const editReview = (review) => async (dispatch) => {
  let res = await csrfFetch(`/api/reviews/${review.id}`, {
    method: "PATCH",
    body: JSON.stringify(review),
    headers: {
      "Content-Type": "application/json",
    },
  });
  if (res.ok) {
    let editedReview = await res.json();
    dispatch(updateReview(editedReview));
  }
};

export const deleteReview = (review) => async(dispatch) => {
    let res = await csrfFetch(`/api/reviews/${review.id}`, {
    method: "DELETE"
  });
    dispatch(removeReview(review))
};

const reviewReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type) {
        case RECEIVE_REVIEW:
            newState[action.review.groupId] = action.review
            return newState;
        case REMOVE_REVIEW:
            delete newState[action.review.groupId]
            return newState;
        default:
            return state;    
    }

}

export default reviewReducer;

   