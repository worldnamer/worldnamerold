sortGoals = ->
  if $('#goals').length > 0
    $('ol').sortable(
      axis: 'y',
      handle: '.fa-sort',
      # JWLL: This code stolen from bryanblakey's post at https://forum.jquery.com/topic/sortable-ol-elements-don-t-display-numbers-properly
      sort: ->
        $lis = $(this).children('li');
        $lis.each ->
          $li = $(this);
          hindex = $lis.filter('.ui-sortable-helper').index();
          if !$li.is('.ui-sortable-helper')
            index = $li.index();
            index = if index < hindex then index + 1 else index;

            $li.val(index);

            if $li.is('.ui-sortable-placeholder')
              $lis.filter('.ui-sortable-helper').val(index);
      # JWLL: This code stolen from Michael Durrant's post at http://stackoverflow.com/questions/7664317/implement-ajax-sortable-lists-with-jquery-and-rails-3
      update: ->
        # After the sort, we need to send this to the server to save the ordering.
        console.log($('ol').sortable('serialize'))
        $.ajax(
          url: Routes.sort_goals_path(),
          type: 'post',
          data: $('ol').sortable('serialize'),
          dataType: 'script'
        );
    );

# Because of Turbolinks, we call this with an event, rather than $.ready
$(document).on 'page:change', sortGoals