!= View::make('decoy::shared.form._header', $__data)->render()

%fieldset
	.legend= empty($item) ? 'New' : 'Edit'
	!= Former::text('title')
	!= Former::wysiwyg('copy')
	!= Former::image()

%fieldset
	!= View::make('decoy::shared.form._display_module', $__data)->render()

!= View::make('decoy::shared.form._footer', $__data)->render()
