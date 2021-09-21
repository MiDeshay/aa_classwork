import { RECEIVE_POKEMON } from "../actions/pokemon_actions"

export const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    //const newState = Object.assign({}, state)
    switch(action.type){
    case RECEIVE_POKEMON:
        // newState[action.payload.items.id] = action.payload.items;
        // return newState

        return action.payload.items
    default:
        return state
    }
}