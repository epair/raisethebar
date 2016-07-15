//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
//  Check Radio-box
    $(".rating input:radio").attr("checked", false);
    $('.rating input').click(function () {
        $(".rating span").removeClass('checked');
        $(this).parent().addClass('checked');
    });

  $('.upvote-submit').on("click",function() {
    event.preventDefault();
    var id = this.id.replace('upvote-submit-', '');
    var path = '/api/reviews/' + id + '/votes.json';
    var vote = {
      vote: { upvote: true }
    };

    var request = $.ajax({
      url: path,
      method: "POST",
      dataType: "json",
      data: vote
    });

    request.done(function(data) {
      var voteCount = document.getElementById('review-sum-' + id);
      voteCount.innerHTML = data.data;
    })
  });

  $('.downvote-submit').on("click", function(){
    event.preventDefault();
    var id = this.id.replace('downvote-submit-', '');
    var path = '/api/reviews/' + id + '/votes.json';

    var request = $.ajax({
      url: path,
      method: "POST",
      dataType: "json",
      data: {
        vote: {upvote: false}
      }
    });

    request.done(function(data) {
      var voteCount = document.getElementById('review-sum-' + id);
      voteCount.innerHTML = data.data;
    })
  });
});
