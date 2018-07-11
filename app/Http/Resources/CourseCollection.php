<?php

namespace App\Http\Resources;

use App\Services\Traits\CourseCheck;
use Illuminate\Http\Resources\Json\ResourceCollection;

class CourseCollection extends ResourceCollection
{

    use CourseCheck;

    public function __construct($resource, $warp = 'data')
    {
        parent::__construct($resource);
        static::$wrap = $warp;
    }

    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $result = [];
        $this->collection->map(function ($item, $key) use (&$result) {
            $teacher = '';
            $category = $item->category;
            $priceType               = $category->filter(function ($item) {
                return $item->id == 24;
            })->isEmpty();
            if(!$priceType || (config('user') && $this->check(config('user'), $item->toArray()))) {
                $item->name .= " (已购)";
            }

            if (!is_null($item->teacher)) {
                $teacher           = $item->teacher;
                $teacher->titlepic = asset(\Storage::url($item->teacher->titlepic));
            }
            $append         = [
                'category' => $category->map(function ($value) {
                    return [
                        'id'   => $value->id,
                        'type' => getCategoryName($value->type),
                        'name' => $value->name,
                    ];
                }),
                'teacher'  => $teacher,
            ];
            $item->titlepic = asset(\Storage::url($item->titlepic));
            $result[]       = array_merge($item->toArray(), $append);

            return $item;
        });

        return $result;
    }
}
