import todo_list from "./todo_list";
import { connect } from "react-redux";
import { allTodos } from "../reducers/selectors";
import { receiveTodo } from "../actions/todo_actions";

const mapStateToProps = (state) =>
{
    return {
        todos: allTodos(state)
    }
} 

const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: (todo) => dispatch(receiveTodo(todo))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(todo_list)

