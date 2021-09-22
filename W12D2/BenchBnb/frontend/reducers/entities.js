import { combineReducers } from "redux";
import {usersReducer} from "./users"

export const entitiesReducer = combineReducers ({
    users: usersReducer
})

