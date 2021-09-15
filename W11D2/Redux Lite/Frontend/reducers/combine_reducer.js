import {roleReducer, userReducer} from './reducer'

const combineReducer = (reducers = {
        users: userReducer,
        roles: roleReducer 
    }) =>{
    const root = (prevState, action) => {
        const newState = {};

        prevState.keys.forEach(ele => {
            newState[ele] = reducer[ele](prevState[ele], action);
        }); 

        return newState;
    }
    return root
}

export default combineReducer