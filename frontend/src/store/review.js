

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
    
}