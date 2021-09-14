
export const TODOS = "TODOS"
export const TODO = "TODO"

export const receiveTodos = todos => {
    type: TODOS,
    todos
}

export const receiveTodo = todo => {
    type: TODO,
    todo
}
