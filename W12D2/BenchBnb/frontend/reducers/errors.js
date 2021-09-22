import { combineReducers } from "redux";
import {sessionErrorsReducer} from "./sessionErrors";

export const errorsReducer = combineReducers ({
    session: sessionErrorsReducer
})  