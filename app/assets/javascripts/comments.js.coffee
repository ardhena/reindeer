$(document).on 'ready page:load', ->

  $(".comment-form .cancel-comment").click ->
    $(".comment-form").slideUp()

  $(".comments .add-comment").click ->
    $(".comment-form").slideToggle()

  # Create a comment
  $(".comment-form")
    .on "ajax:beforeSend", (evt, xhr, settings) ->
      $(this).find('#comment_title')
        .addClass('uneditable-input')
        .attr('disabled', 'disabled');
      $(this).find('#comment_comment')
        .addClass('uneditable-input')
        .attr('disabled', 'disabled');
    .on "ajax:success", (evt, data, status, xhr) ->
      $(this).find('#comment_title')
        .removeClass('uneditable-input')
        .removeAttr('disabled', 'disabled')
        .val('');
      $(this).find('#comment_comment')
        .removeClass('uneditable-input')
        .removeAttr('disabled', 'disabled')
        .val('');
      $(xhr.responseText).hide().insertAfter($(this)).show('slow')