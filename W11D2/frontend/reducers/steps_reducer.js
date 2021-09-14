import {RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions'

const stepsReducer = (state = {}, action) => {
    Object.freeze(state);
    const newState = Object.assign({}, state);
    switch (action.type){

        case RECEIVE_STEPS:
            action.steps.forEach((step)=> {
                newState[step.id] = step;
            })
            return newState

        case RECEIVE_STEP:
            newState[action.step.id] = action.step;
            return newState

        case REMOVE_STEP:
            delete newState[action.step.id]
            return newState

        default: 
            return state; 
    }
}

export default stepsReducer