/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Asteroid(position) {\n    \n    // this.position = position;\n    // this.velocity = Util.randomVec(3);\n    // this.radius = 25;\n    // this.color = \"#DCDCDC\";\n    asteroid = {\n        position: position,\n        velocity: Util.randomVec(3),\n        radius: 25, \n        color: \"#DCDCDC\" \n     }\n   \n\n   MovingObject.call(this, asteroid)\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n\nfunction Game(){\n    this.DIM_X = 600;\n    this.DIM_Y = 600;\n    this.NUM_ASTEROIDS = 6;\n    this.asteroids = []\n    this.addAsteroids()\n}\n\nGame.prototype.randomPosition = function(){\n    let randX = Math.random() * 600;\n    let randY = Math.random() * 600;\n    return [randX, randY];\n}\n\nGame.prototype.addAsteroids = function(){\n    for(let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        randPos = this.randomPosition();\n        let asteroid = new Asteroid(randPos);\n        this.asteroids.push(asteroid);\n    }\n}\n\n\nGame.prototype.draw = function(ctx){\n    let canvasEl = document.getElementById('game-canvas');\n    ctx.clearRect(0, 0, canvasEl.width, canvasEl.height);\n\n    for(let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx);\n    }\n}\n\nGame.prototype.moveObjects = function() {\n    for(let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].move();\n    }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction GameView(ctx){\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n    const that = this;\n    \n    setInterval(function(){\n        that.game.moveObjects();\n        that.game.draw(that.ctx);\n    } , 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\") \nwindow.MovingObject = MovingObject;\n\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nwindow.Util = Util;\n\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nwindow.Asteroid = Asteroid;\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nwindow.Game = Game;\n\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nwindow.GameView = GameView;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    let canvasEl = document.getElementById('game-canvas');\n    let canvasContext = canvasEl.getContext(\"2d\");\n}) \n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(optionsHash) {\n    this.position = optionsHash[\"position\"];\n    this.velocity = optionsHash[\"velocity\"];\n    this.radius = optionsHash[\"radius\"];\n    this.color = optionsHash[\"color\"];\n}\n\n\nMovingObject.prototype.draw = function (ctx){\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n\n    ctx.arc(\n        this.position[0],\n        this.position[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false\n    );\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n    this.position[0] += this.velocity[0];\n    this.position[1] += this.velocity[1];\n\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("\nconst Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n          const deg = 2 * Math.PI * Math.random();\n          return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n        \n    scale(vec, m) {\n          return [vec[0] * m, vec[1] * m];\n    }\n    \n}\n\n module.exports = Util\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;