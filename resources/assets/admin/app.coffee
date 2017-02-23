# Enable file uploads
wysiwyg = require 'decoy/assets/js/wysiwyg/factory'

# Customize wysiwyg options
wysiwyg.config.allowUploads()
wysiwyg.config.merge({
	plugins: ['fontcolor']
	buttons: ['formatting', 'bold', 'italic', 'link', 'file', 'image', 'horizontalrule', 'orderedlist', 'unorderedlist', 'html']
	formatting: ['p', 'h2', 'h3']
	# formattingAdd: [
	# 	{
	# 		# Demo of custom Redactor formatting
	# 		tag: 'p',
	# 		title: 'Test Class',
	# 		class: 'test-class'
	# 	}
	# ]
})

# Start up Decoy
require './start.scss'
# require 'decoy/assets/sass/_decoy.scss'

# Init JS
decoy = require 'decoy'
decoy.trigger 'ready'
