define (require) ->

	# Dependencies
	$ = require('jquery')
	_ = require('lodash')
	Backbone = require('backbone')

	View =
		initialize: (options) ->
			_.bindAll this
			@$win = $(window)
			@$body = $('body')
			@$win.on 'scroll', @onScroll
			@onScroll()
			return

		onScroll: ->
			if (@$body.scrollTop() > 400)
				$(@$el).addClass('not-at-top')
			else
				$(@$el).removeClass('not-at-top')
			return

	Backbone.View.extend View
