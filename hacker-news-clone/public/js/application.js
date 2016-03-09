$(document).ready(function() {
  $(".post-upvote").on('click', function(event){
    event.preventDefault();

    var path = this.action
    var id = event.target.parentNode.getAttribute('data-vote-id')
    $.ajax({
      url: path,
      type: 'post',
      data: $(this).serialize
    }).done(function(data){
      $("#post-vote-container"+id).html(data)
    }).fail(function(){
      console.log("i mean you tried")
    })
  })

  $(".comment-upvote").on('click', function(event){
    event.preventDefault();
    var id = event.target.parentNode.getAttribute('data-vote-id')

    $.ajax({
      url: this.action,
      type: 'post',
      data: $(this).serialize
    }).done(function(data){
      $("#comment-vote-container"+id).html(data)
    }).fail(function(){
      console.log("is ok u tried")
    })
  })
});
