changeTab = () ->
  $('.accordion-tabs-minimal').each (index) ->
    $(this).children('li').children('a.is-active').next().addClass('is-open').show()

  $('.accordion-tabs-minimal').on 'click', 'li > a', (event) ->
    unless $(this).hasClass('is-active')
      $accordionTabs = $(this).closest('.accordion-tabs-minimal')
      $accordionTabs.find('.is-open').removeClass('is-open').hide()
      $(this).next().toggleClass('is-open').toggle()
      $accordionTabs.find('.is-active').removeClass 'is-active'
      $(this).addClass 'is-active'

    event.preventDefault()

$(document).on 'page:change', changeTab