###
Settings
###

# App level config
config =
	appName:      'lightwave'
	slackChannel: '#xxxxxxx'

# Staging config
config.staging =
	servers:  'xxxx@xxxxxxxx'
	deployTo: "/storage/avxxx/#{config.appName}/staging" # Must be absolute
	url:      "http://#{config.appName}.stage.bkwld.com"

	# Production config
config.production =
	servers:  'xxxx@xxxxxxxx'
	deployTo: "/storage/avxxx/#{config.appName}/production" # Must be absolute
	url:      'http://www.xxxxxxxx.com'

###
Execute
###

deploy = require('camo/tools/shipit')
module.exports = (shipit) ->
	deploy.init(shipit, config)
