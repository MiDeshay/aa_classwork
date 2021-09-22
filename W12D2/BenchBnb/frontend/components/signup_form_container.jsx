import { connect } from "react-redux";
import SessionForm from "./session_form";
import { signUpUser } from "../actions/session_actions";

const mSTP = (state, ownProps) => ({
    errors: state.errors,
    formType: "Sign Up"
})

const mDTP = (dispatch, ownProps) => ({
    processForm: (user) => dispatch(signUpUser(user))
}) 
export default connect(mSTP,mDTP)(SessionForm)