const FollowToggle = require("./follow_toggle");

$(()=>{
  $("button.follow-toggle").each((idx, ele) => {
      new FollowToggle(ele);

  })
  $("nav.users-search").each((idx, ele) => {
      new UserSearch(ele)
  })
})



