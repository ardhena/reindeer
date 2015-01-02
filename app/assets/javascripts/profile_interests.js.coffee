$(document).on 'ready page:load', ->

  $("form.edit_user .user_interest_list").prepend('
      <div class="checkbox" style="font-weight: bold;">
        Interest list
      </div>
    ')