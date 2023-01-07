import csrfFetch from "./csrf";


const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";
const RECEIVE_REVIEW = "reviews/RECEIVE_REVIEW";
const REMOVE_REVIEW = "reviews/REMOVE_REVIEW";

const receiveReview = (review) => ({
  type: RECEIVE_REVIEW,
  review,
});

const removeReview = (reviewId) => ({
    type: REMOVE_REVIEW,
    reviewId
})

const receiveReviews = (reviews) => ({
  type: RECEIVE_REVIEWS,
  reviews
});

export const getUsersReviewForGroup = (store) => {
    if (store.reviews) {
        return Object.values(store.reviews);
    } else {
        return null;
    }
}

export const fetchUserReviewForGroup = (groupId) => async(dispatch) => {
  let res = await csrfFetch(`/api/reviews?group_id=${groupId}`);
  if (res.ok) {
    let reviews = await res.json();
    dispatch(receiveReviews(reviews, groupId));
  }
}

export const createReview = (groupId, summary) => async(dispatch) => {
    let res = await csrfFetch("/api/reviews", {
      method: "POST",
      body: JSON.stringify({ groupId, summary }),
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
    dispatch(receiveReview(editedReview));
  }
};

export const deleteReview = (reviewId) => async (dispatch) => {
  let res = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "DELETE",
  });
  dispatch(removeReview(reviewId));
};

const reviewReducer = (state = {}, action) => {
    let newState = {...state};
    switch (action.type) {
        case RECEIVE_REVIEW:
            newState[action.review.id] = action.review
            return newState;
        case RECEIVE_REVIEWS:
            return {...state, ...action.reviews}
        case REMOVE_REVIEW:
            delete newState[action.reviewId];
            return newState;
        default:
            return state;    
    }
}


export default reviewReducer;

   