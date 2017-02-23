This directory is for third party code that gets committed to the repo.  For instance, customized builds of libraries or stuff that isn't on npm.

## Modernizr

Modernizr gets pulled from here into the layout (injeced inline) outside of Webpack.  See https://github.com/Modernizr/Modernizr/issues/1204#issuecomment-142143094

## jQuery

Consider using http://projects.jga.me/jquery-builder/ to build a jQuery without AJAX and effects if the site is using Vue for AJAX and Velocity for animation.  Just download the build to here, named jquery.js.

Here's an example build that saves 20k: https://raw.githubusercontent.com/jgallen23/jquery-builder/0.7.0/dist/1.11.1/jquery-ajax-deprecated-effects.js
.
