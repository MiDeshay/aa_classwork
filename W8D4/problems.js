class Clock {
    constructor(){
        const date = new Date();
        this.minutes = date.getMinutes();
        this.hours = date.getHours();
        this.seconds = date.getSeconds();
         
        this.printTime();
        setInterval(this._tick, 1000); 
    }

    printTime (){
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }

    _tick(){
        
    }
    
}