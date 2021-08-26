class Clock {
    constructor(){
        const date = new Date();
        this.minutes = date.getMinutes();
        this.hours = date.getHours();
        this.seconds = date.getSeconds();
         
        this.printTime();
        const clockTick = this._tick.bind(this);
        setInterval(clockTick, 1000); 
    }

    printTime(){
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }

    _tick(){
        this.seconds += 1;
        if (this.seconds > 60){
            this.seconds = this.seconds % 60;
            this.minutes += 1;
            if (this.minutes > 60){
                this.minutes = this.minutes % 60;
                this.hours += 1;
                if (this.hours > 24){
                    this.hours = this.hours % 24;
                }
            }

        }
        this.printTime();
    }
    
}

const clock = new Clock();