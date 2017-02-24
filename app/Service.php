<?php namespace App;
use Bkwld\Decoy\Models\Base;
use Bkwld\Decoy\Models\Traits\HasImages;

class Service extends Base {
	use HasImages;

	/**
	 * Validation rules
	 *
	 * @var array
	 */
	public static $rules = [
		'title' => 'required',
	];

	/**
	 * Put new instances at the end
	 *
	 * @return void
	 */
	public function onCreating() {
		if (isset($this->position)) return;
		$this->position = self::max('position') + 1;
	}

	/**
	 * Orders instances of this model in the admin as well as default ordering
	 * to be used by public site implementation.
	 *
	 * @param  Illuminate\Database\Query\Builder $query
	 * @return void
	 */
	public function scopeOrdered($query) {
		$query->positioned();
	}

}
