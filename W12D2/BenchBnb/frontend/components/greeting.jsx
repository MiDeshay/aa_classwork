import React from 'react'
import {Link} from 'react-router-dom'

class Greeting extends React.Component {
    constructor(props){
        super(props)
    }
    
    render() {
        const display = this.props.currentUser ? (<div>
            <h1>Welcome, {this.props.currentUser.username}</h1>
            <button onClick={this.props.logout}>Log Out</button>
        </div>) : (<div>
            <Link to="/signUp">Sign Up</Link>
            <br/>
            <Link to="/login">Log In</Link>
        </div>) 


        return(
            <div>
              {display}
            </div>
         )
    }
    
}

export default Greeting