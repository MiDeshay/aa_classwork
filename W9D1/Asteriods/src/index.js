const MovingObject = require("./moving_object.js") 
window.MovingObject = MovingObject;

const Util = require("./util.js")
window.Util = Util;

const Asteroid = require("./asteroid.js")
window.Asteroid = Asteroid;

const Game = require("./game.js")
window.Game = Game;

const GameView = require("./game_view.js")
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', (event) => {
    let canvasEl = document.getElementById('game-canvas');
    let canvasContext = canvasEl.getContext("2d");
}) 