import {roleReducer, userReducer} from './reducer'

const combineReducer = (reducers = {
        users: userReducer,
        roles: roleReducer 
    }) =>{
    const root = (prevState, action) => {
        prevState.keys.forEach(ele => {
            
        }); 
    }
    return
}