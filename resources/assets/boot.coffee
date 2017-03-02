###
Webpack has issues generating css source maps with scss files that are in the
same directory as entry js.  So this entry file dials out to modules in sub
directories to work around this.
###

# Load styles that aren't referenced within JS
require './start/app.styl'
require './utils/normalize.styl'

# Global styles
require './global/header.styl'
require './global/footer.styl'

# Home
require './home/marquee.styl'
require './home/contact.styl'
require './home/what-we-do.styl'
require './home/about-us.styl'

# Async request app.js so that it doesn't block the DOM
require ['./start/app']
