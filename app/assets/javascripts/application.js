// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery_nested_form

//Rating
var $stars;

jQuery(document).ready(function ($) {

  // Custom whitelist to allow for using HTML tags in popover content
  var myDefaultWhiteList = $.fn.tooltip.Constructor.Default.whiteList
  myDefaultWhiteList.textarea = [];
  myDefaultWhiteList.button = [];

  $stars = $('.rate-popover');
  
  const currentPost = $('#current_post');
  const postId = currentPost.data('id');
  let exists_rank = false;
  let response_request;
  let rank_id;
  let new_rank;

  $stars.on('mouseover', function () {
    var index = $(this).attr('data-index');
    markStarsAsActive(index);
  });

  function markStarsAsActive(index) {
    unmarkActive();
    for (var i = 0; i <= index; i++) {
      $($stars.get(i)).addClass('amber-text');
    }
  }

  function unmarkActive() {
    $stars.removeClass('amber-text');
  }

  $stars.on('click', function () {
    new_rank = $(this).attr('data-index');
    $stars.popover('hide');
  });

  // Submit, you can add some extra custom code here
  // ex. to send the information to the server
  $('#rateMe').on('click', '#voteSubmitButton', function () {
    $stars.popover('hide');
    let url_request = "/rankings"
    if (exists_rank) {
      url_request += ("/"+rank_id);

      $.ajax({
          type: 'PATCH',
          url: url_request,
          data: JSON.stringify ({id: rank_id,ranking:{post_id:postId, rank: new_rank},commit:"Update Ranking"}),
          success: function(data) {/* alert('data: ' + data);*/ },
          contentType: "application/json",
          dataType: 'json'
      });
    } else {
      $.ajax({
        type: 'POST',
        url: url_request,
        data: JSON.stringify ({ranking:{post_id:postId, rank: new_rank},commit:"Create Ranking"}),
        success: function(data) { /*alert('data: ' + data); */},
        contentType: "application/json",
        dataType: 'json'
    });
    }   
  });
 
  // Cancel, just close the popover
  $('#rateMe').on('click', '#closePopoverButton', function () {
    $stars.popover('hide');
  });

});

$(function () {
  $('.rate-popover').popover({
    // Append popover to #rateMe to allow handling form inside the popover
    container: '#rateMe',
    // Custom content for popover
    content: `<div class="my-0 py-0"><button id="voteSubmitButton" type="submit" class="btn btn-sm btn-primary">Submit!</button> <button id="closePopoverButton" class="btn btn-flat btn-sm">Close</button>  </div>`
  });
  $('.rate-popover').tooltip();
});