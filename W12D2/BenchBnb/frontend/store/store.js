import {createStore, applyMiddleware} from 'redux'
import {rootReducer} from "../reducers/root"
import thunk from 'redux-thunk'
import logger from 'redux-logger'

export const configureStore = (preloadedState={}) =>(
    createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger))
)