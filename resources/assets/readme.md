## Asset boot order

1. `bootstrap.coffee` is the entry file for webpack, it is loaded first.
2. `bootstrap.coffee` requires `start/app.coffee` and `start/app.styl` for reasons described within a comment file in that block.  `bootstrap.coffee` should rarely require additional modifications.
3. Application specific code takes over in each of those files.

## Require references

#### Coffeescript

If called in /resources/assets/start/app.coffee:

- `require 'jquery'` - Returns /resources/assets/node_modules/jquery/dist/jquery.js
- `require 'some/module'` - Returns /resources/assets/some/module.coffee
- `require '../some/module'` - Returns /resources/assets/some/module.coffee
- `require 'some/module.styl'` - Requires /resources/assets/some/module.styl which will get compiled into /public/dist/app.css
- `require './module.styl'` - Requires /resources/assets/start/module.styl which will get compiled into /public/dist/app.css
- `require './logo.png'` - Requires /resources/assets/start/logo.png and returns the string "/dist/img/{HASH}.png" (assuming the filesize is <10k)

#### Stylus

If called in /resources/assets/start/app.styl:

- `@import 'some/module'` - Imports /resources/assets/start/some/module.styl
- `@import '~some/module'` - Imports /resources/assets/some/module.styl
- `@import '~some/*.styl'` - If run from a sass while who was required diretly from JS, will import all sass files from /resources/assets/some
