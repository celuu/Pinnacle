import {createStore, combineReducers, applyMiddleware, compose} from 'redux';
import thunk from 'redux-thunk';
import session from './session';
import groupReducer from './group';
import reservationReducer from './reservation';
import reviewReducer from './review';
import clubReducer from './club';


let enhancer;
export const rootReducer = combineReducers({
    session,
    groups: groupReducer,
    reservations: reservationReducer,
    reviews: reviewReducer,
    clubs: clubReducer
})

if (process.env.NODE_ENV === 'production') {
    enhancer = applyMiddleware(thunk);
} else {
    const logger = require('redux-logger').default;
    const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}


const configureStore = (preloadState = {}) => {
    return createStore(rootReducer, preloadState, enhancer)
}

export default configureStore