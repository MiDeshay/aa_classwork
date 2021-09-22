import { connect } from "react-redux";
import { loginUser } from "../actions/session_actions";
import SessionForm from "./session_form";

const mSTP = (state, ownProps) => ({
    errors: state.errors,
    formType: "Login"
})

const mDTP = (dispatch, ownProps) => ({
    processForm: (user) => dispatch(loginUser(user))
})  

export default connect(mSTP,mDTP)(SessionForm)