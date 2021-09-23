import { combineReducers } from "redux";
import { benchesReducer } from "./benches_reducer";
import {usersReducer} from "./users"

export const entitiesReducer = combineReducers ({
    users: usersReducer,
    benches: benchesReducer
})

