###
Module registrations that should occur as fast as possible
###

# Plugins that should be made available globally
require 'velocity'
require 'jquery-backbone-views'
require('fastclick').attach(document.body);

# Start app code
# $('.icon-search').views(require('global/search-toggle'))

$('.load-in').views(require('utils/in-viewport'))
$('#header').views(require('home/header'))
