export default class Store{
    constructor(rootReducer){
        this.rootReducer = rootReducer;
        this.state = {};
    }

    getState(){
        const curState = Object.assign({}, this.state);
        return curState;
    }

    dispatch(){
    }
}