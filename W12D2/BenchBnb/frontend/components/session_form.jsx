import React from "react";
import { Link } from "react-router-dom";

class SessionForm extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            username: "",
            password: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this)
        this.handleInput = this.handleInput.bind(this)
    }

    handleSubmit(e){
        e.preventDefault()
        this.props.processForm(this.state)
    }

    handleInput(type){
        return (e) => this.setState({[type]: e.currentTarget.value})
    }

    render(){
        const link = this.props.formType === "Login" ? "/signup" : "/login"
        const linkTitle = this.props.formType === "Login" ? "Sign Up" : "Login"
        const errors = this.props.errors === [] ? this.props.errors : ""
        return(
            <div>
                <h2>{this.props.formType}</h2>
                <Link to={link}> {linkTitle}</Link>
                <h4>{errors}</h4>
                <form>
                    <label>Username:
                        <input type="text" value={this.state.username} onChange={this.handleInput('username')}/>
                    </label>
                    <label>Password:
                        <input type="password" value={this.state.password} onChange={this.handleInput('password')}/>
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>

            </div>
        )
    }
}

export default SessionForm