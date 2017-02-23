## Commands

### Setup

#### `php artisan camo:scaffold`

**Removes** unnecessary Laravel 5 boilerplate and copies BKWLD files from the scaffold directory of the project.  It **will not** override files.  Thus, running it twice has no effect.  Though you may delete a file that was installed by Camo and it will replace it next time the command is run.

#### `npm run init`

Creates the local .env file based on your responses to prompts.  Then, install all dependencies, runs migrations, and install githooks to keep everything up to date between pulls.


### Development

#### `npm run watch`

Uses a more traditional file watcher to force recompiles.  Also generates sourcemaps.  Because of better sourcemap support, this mode is good for debugging someone else's code since you can use Chrome deve tools to quickly get to the correct line number.

#### `npm run dev`

Uses the Webpack dev server and hot module reloading to update the page with your changes.  This approach has quicker recompile times than the watch approach (because of no sourcemaps) and will hot reload JS as well as CSS.

### `npm run minify`

Minifies all resources, as before a deploy.


### Deployment

#### `npm run deploy:staging`

Deploy the `origin/master` branch via Shipit.

#### `npm run deploy:production`

Deploy the `origin/production` branch via Shipit.

#### `npm run rollback:production`

Rollback production environment to previous release via Shipit.


## Usage notes

- When adding new npm dependencies, follow this pattern: `npm install NEW PACKAGE --save && npm dedupe && npm shrinkwrap`.  This will install the package, update the package.json, flatten the dependency tree to reduce duplicate dependencies in the compiled assets, and finally update the npm-shrinkwrap.json which ensures we're all installing the same versions.

- Shipit builds the project locally in your /tmp directory before rsyncing up to the server. Your /tmp directory is cleaned on restart, so your initial deploys after restart will take longer.

- Shipit pulls from `origin/master` when deploying to "staging" and `origin/production` when deploying to production.  Thus, you will need to push to those branches before deploying.

- You are encouraged to contribute to and create new client-side npm packages while working on a project.  Read [this wiki](https://github.com/BKWLD/camo/wiki/Workbenching-npm-packages) for an example workflow.
