const APIUtil = require("./api_util");

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