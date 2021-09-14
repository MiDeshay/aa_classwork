export const roleReducer = (oldRole = null, action) => {
    if (action.type === "change role") {
      return action.newRole;
    } else {
      return oldRole;
    }
  };

  export const userReducer = (oldUser = null, action) => {
    if (action.type === "change user") {
      return action.user;
    } else {
      return oldUser;
    }
  };

