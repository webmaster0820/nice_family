jQuery(document).on 'turbolinks:load', ->
  members = $('#members')
  count = members.find('.count > span')

  recount = -> count.text members.find('.nested-fields').size()

  members.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  members.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()

  members.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  members.on 'cocoon:after-remove', (e, removed_el) ->
    recount()
