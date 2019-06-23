jQuery -> 
  "use strict"
  # Floating label headings for the contact form
  $( "body" ).on("input propertychange", ".floating-label-form-group", (e) ->
    $(@).toggleClass "floating-label-form-group-with-value", !!$(e.target).val()
  ).on("focus", ".floating-label-form-group", ->
    $(@).addClass "floating-label-form-group-with-focus"
  ).on("blur", ".floating-label-form-group", ->
    $(@).removeClass "floating-label-form-group-with-focus"
  )

  minimunScreenSize = 992
  
  #primary navigation slide-in effect
  if $(window).width() > minimunScreenSize
    headerHeight = $('#mainNav').height()
    $(window).on('scroll', 
      previousTop: 0,
      ->
        currentTop = $(window).scrollTop()
        #check if user is scrolling up
        if (currentTop < @.previousTop)
          #if scrolling up...
          if currentTop > 0 && $('#mainNav').hasClass('is-fixed')
            $('#mainNav').addClass('is-visible')
          else
            $('#mainNav').removeClass('is-visible is-fixed')
        else if currentTop > @.previousTop
          #if scrolling down...
          $('#mainNav').removeClass('is-visible')
          $('#mainNav').addClass('is-fixed') if (currentTop > headerHeight && !$('#mainNav').hasClass('is-fixed'))
        @.previousTop = currentTop
      )

$('.remove-posts_category:first').hide()

reorderPostsCategories = ->
  $('#posts_categories-form h4.subsection.new-posts_categories span:visible').each((index) ->
    $(@).html(index + 1)
  )

$(document).on('nested:fieldAdded nested:fieldRemoved', (event) ->
  reorderPostsCategories()
)