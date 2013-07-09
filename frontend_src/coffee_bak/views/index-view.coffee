define [
         'views/base/view'
         'text!templates_compiled/combined.js'
       ], (View, template) ->
  'use strict'

  class IndexView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'index'
    region: 'main'

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null