$ ->
  $('html').hover(
    ->
      $('#nav').show(400);
    ->
      $('#login').hide();
      $('#nav').hide(400);
  );

  $('#show-login').click ->
    $('#login').show();