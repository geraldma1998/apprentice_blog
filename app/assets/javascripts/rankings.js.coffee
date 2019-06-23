
$(document).on "turbolinks:load", ->
  return unless $("body").data("controller") == "posts" && $("body").data("action") == "show"

  $stars = $('.rate-popover')

  new_rank = 0
  currentElement = $('#current_post')
  postId = currentElement.attr "data-post"
  userId = currentElement.attr "data-user"
  
  $stars.on('mouseover', ->
    index = $(@).attr('data-index')
    markStarsAsActive(index)
  )

  markStarsAsActive = (index) -> 
    unmarkActive()
    i = 0
    while i <= index
      $($stars.get(i)).addClass('amber-text')
      i++

  unmarkActive = ->
    $stars.removeClass('amber-text')

  $stars.on('click', ->
    new_rank = $(@).attr('data-index')
    url_request = "/rankings"

    $.ajax(
        type: 'POST',
        url: url_request,
        data: JSON.stringify (
          post_id: postId
          user_id: userId
          rank: new_rank,
          commit: "Change Ranking"
        )
        success: (data) ->
        contentType: "application/json"
        dataType: 'json'
    )
  )