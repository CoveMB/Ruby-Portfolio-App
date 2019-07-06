ready = ->
  Typed.new '.element',
    strings: [
      'Software development is the closest concept we have to magic.'
      "It's my goal to ensure that we build an app that will have all the features you could dream of."
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
