/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        return $.ajax({
            url:`/users/${id}/follow`,
            type: "post",
            dataType: "json"
            })
    },

    unfollowUser: id => {
       return $.ajax({
            url: `/users/${id}/follow`,
            method: "delete",
            dataType: "json"
        })
    }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle{
  // this.userId = el.data-user-id;
  // this.followState = el.intital-follow-state;
  constructor(el){
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-initial-follow-state");
    // this.render.bind(this);
    this.render();
    this.$el.on("click", this.handleClick.bind(this));


  }
  render(){
    console.log(this.$el);
    if (this.followState === "followed"){
      this.$el.text( "Unfollow!");
      this.$el.prop("disabled", false);
    }else if (this.followState === "unfollowed"){
      this.$el.text( "Follow!");
      this.$el.prop("disabled", false);
    }else if (this.followState === "following"){
      this.$el.text( "Following!");
      this.$el.prop("disabled", true);
    }else if (this.followState === "unfollowing"){
      this.$el.text( "Unfollowing!");
      this.$el.prop("disabled", true);
    }
  }

  handleClick(event){
    event.preventDefault();
    // debugger;
    if (this.followState === "followed"){
      this.followState = "unfollowing";
      this.render();
      return APIUtil.unfollowUser(this.userId).then(()=>{
      this.followState = "unfollowed";
      this.render()
      ;})
    
    }else{
      this.followState = "following";
      this.render();
      return APIUtil.followUser(this.userId).then(()=>{
        this.followState = "followed";
        this.render();
      })
      

      
    } 
  }
}

// FollowToggle.prototype.render = function(){
//   if (this.followState === "followed"){
//     this.$el.innerText( "Unfollow!");
//   }else{
//     this.$el.innerText( "Follow!");
//   }
// }

// FollowToggle.prototype.handleClick = function (event){
//   event.preventDefault();
//   if (this.followState === "followed"){
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "delete"
//     }).then(()=>{this.followState = "unfollowed"})
//     .then(this.render);
//   }else{
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "post"
//     }).then(()=>{this.followState = "followed"})
//     .then(this.render);
//   }
// }



module.exports = FollowToggle;

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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(()=>{
  $("button.follow-toggle").each((idx, ele) => {
      new FollowToggle(ele);

  })
  $("nav.users-search").each((idx, ele) => {
      new UserSearch(ele)
  })
})




})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map