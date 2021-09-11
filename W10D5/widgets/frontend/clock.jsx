import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      time: new Date()
    }
    this.tick.bind(this);
  }

  componentDidMount() {
    this.intTick = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intTick);
  }

  tick(){
    this.setState({time: new Date()});
  }

  render() {
    const time = this.state.time.toTimeString()
    const date = this.state.time.toDateString()
    return(
    <div className="clock">
      <div className="row">
        <h1 className="clock-h1">Clock</h1>
        <div>{time}</div>
      </div>
      <div className="row">
        <h1 className="date-h1">Date</h1>
        <div>{date}</div>
      </div>
    </div>
    )
  }
}

export default Clock;