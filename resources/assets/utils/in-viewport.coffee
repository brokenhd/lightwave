define (require) ->

  # Dependencies
  $ = require('jquery')
  _ = require('lodash')
  Backbone = require('backbone')

  ###
  # Setup view
  ###

  View =
    initialize: (options) ->
      _.bindAll this
      # Toggle nav
      @$win = $(window)

      # Cache the height and position of the element
      @elHeight = @$el.outerHeight()
      @elPositionTop = @$el.offset().top
      @offset = @$el.data('offset')

      # If the offset isnt set, set it to 0
      if !@offset
        @offset = 0

      # Set the scroll listener
      @throttledCheck = _.throttle(_.bind(@checkViewport, @), 200)
      @$win.on 'scroll', @throttledCheck

      # Fire it on load to check if anything should load automatically
      @checkViewport()

      return

    # Check the position of the element against the window scroll position
    checkViewport: ->

      # If the element is past the scroll position and offset, add in-viewport
      if @elPositionTop + @offset <= @$win.scrollTop() + @$win.outerHeight()
        @$el.addClass 'in-viewport'
        @$el.trigger 'in-viewport'

        # Stop from firing again
        @$win.off 'scroll', @throttledCheck
      return

  # Return view class
  Backbone.View.extend View
