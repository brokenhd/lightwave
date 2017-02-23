<?php return [

	/**
	 * The name of the site.  Is inserted into the title tag and can be used
	 * in other places
	 *
	 * @var string
	 */
	'name' => null,

	/**
	 * Default description that is put in meta tags
	 *
	 * @var string
	 */
	'description' => null,

	/**
	 * A boolean to toggle when the site goes live.  Custom site logic
	 * can hang off that.  By default, it has the following effects:
	 *
	 * - Non-local enviornments require an authenticated decoy user
	 * - Disables search engine spidering via robots.txt rules
	 *
	 * @var boolean|callable
	 */
	'live' => env('SITE_LIVE', false),

	/**
	 * Set specifically whether to show the auth gate. Uses it's own ENV var
	 * but has an intellient default.  The middleware will do the checks to see
	 * if the user is already logged in.
	 *
	 * @var boolean|callable
	 */
	'auth_gate' => function() {

		// Don't show gate if for a public path
		$is_public = request()->is('robots.txt', 'favicon.ico') ||

			// ... or if app is running on a local/dev environment
			app()->environment() == 'local' ||

			// ... or if running on production and the site is live
			(app()->environment() == 'production' && app('camo.site-live'));

		return env('AUTH_GATE', !$is_public);
	},

	/**
	 * Set specifically whether to deny all robots / search engines. Uses it's own
	 * ENV var but has an intellient default.
	 *
	 * @var boolean|callable
	 */
	'deny_robots' => function() {
		$blacklist = ['stage.bkwld.com', 'prod.bkwld.com'];
		return env('DENY_ROBOTS',

			// Don't index requests from staging domains
			str_contains(request()->getHost(), $blacklist) ||

			// ... or non-production environments
			app()->environment() != 'production' ||

			// ... or is non live (which implies production because of previous check)
			!app('camo.site-live')
		);
	},

];
