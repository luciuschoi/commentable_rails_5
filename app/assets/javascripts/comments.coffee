# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $(document).on 'keyup', '.comment_content textarea', ->

# $(document).on "turbolinks:load", ->
#   $(".comment_content textarea").keyup (event) ->

$(document).on 'keyup', '.comment_content textarea', (e) ->
  comment_id = $(this).data("comment-id")
  console.log comment_id
  counter = $("#counter_#{comment_id}")
  charsRemaining = 255 - ($(this).val().length)
  counter.text "남은 글자 수 : #{charsRemaining}"
  counter.css 'color', if charsRemaining < 0 then 'red' else 'black'
  return

$(document).on "click", '.close_button', (e) ->
  e.preventDefault()
  comment_id = $(this).data("comment-id")
  $("#comment_#{comment_id}_edit").show();
  $(this).closest('form').slideUp ->
    $(this).remove()
  return
