import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

// const initialState = {
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     }
//   };

        [{
          id: 1,
          title: "wash car",
          body: "with soap",
          done: false
        },
        {
          id: 2,
          title: "wash dog",
          body: "with shampoo",
          done: true
        },
        {
            id: 3,
            title: "car dog",
            body: "with leather",
            done: true
          }
    ]


const todosReducer = (state= {}, action) => {
    Object.freeze(state);
    const newState = Object.assign({}, state)
    switch (action.type){
        case RECEIVE_TODOS:
            console.log(action)
            action.todos.forEach((e)=> {
                newState[e.id] = e;
            })
            return newState

        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo;
            return newState
        default : 
            return state; 
    }
}
export default todosReducer;