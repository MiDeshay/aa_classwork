class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    //this.handleClick = this.handleClick.bind(this);
    this.bindEvents();
    this.el.append(this.setupBoard());
   
  }

  setupBoard() {
    const grid = document.createElement("ul");
    grid.setAttribute("class", "grid");

    for(let i=0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        let square = document.createElement("li");
        // square.addEventListener("click", this.handleClick)
        square.setAttribute("class", "square");
        square.setAttribute("data-x", i);
        square.setAttribute("data-y", j);
        grid.append(square);
      }
    }
    return grid;
  }


  
  bindEvents() {
    this.el.addEventListener('click', this.handleClick.bind(this))
  }

  handleClick(e) {
    let ele = e.target;
    this.makeMove(ele);
    
  }

  makeMove(square) {
    square.setAttribute("class", "white")
    let pos = [Number(square.getAttribute('data-x')), Number(square.getAttribute('data-y'))]
    console.log(this);
    this.game.playMove(pos);
  }

}

module.exports = View;
