/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	// The require scope
/******/ 	var __webpack_require__ = {};
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
/*!*******************!*\
  !*** ./entry.jsx ***!
  \*******************/
__webpack_require__.r(__webpack_exports__);
Object(function webpackMissingModule() { var e = new Error("Cannot find module './store/store'"); e.code = 'MODULE_NOT_FOUND'; throw e; }());
// import React from "react";
// import ReactDom from 'react-dom';

document.addEventListener("DOMContentLoaded", function () {
  //ReactDom.render(<h1>Redux Lite</h1>, document.getElementById('root'))
  window.store = new Object(function webpackMissingModule() { var e = new Error("Cannot find module './store/store'"); e.code = 'MODULE_NOT_FOUND'; throw e; }())(reducer);
});
/******/ })()
;
//# sourceMappingURL=bundle.js.map