const View = require("./ttt-view");
const Game = require("../ttt_node/game.js");

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const board = document.querySelector('figure')
  const game = new Game();
  const view = new View(game, board);

});
