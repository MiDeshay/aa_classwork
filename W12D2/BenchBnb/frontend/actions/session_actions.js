import { signUp, login, logout } from "../util/session_api_util";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";


const receiveCurrentUser = (user) => ({
    type: RECEIVE_CURRENT_USER, 
    user 
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
})

export const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    errors: errors
})

export const loginUser = (user) => dispatch => {
    login(user).then((response) => dispatch(receiveCurrentUser(response)))
}

export const logoutUser = () => dispatch => {
    logout().then(() => dispatch(logoutCurrentUser()))
}

export const signUpUser = (user) => dispatch => {
    signUp(user).then((res) => dispatch(receiveCurrentUser(res)));
}


