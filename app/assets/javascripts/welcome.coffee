$ ->
  if $('#welcome').length > 0
    $('html').hover(
      ->
        $('#welcome #nav').show(400);
      ->
        $('#login').hide();
        $('#welcome #nav').hide(400);
    );

    $('#show-login').click ->
      $('#login').show();
      $('#user_password').focus();