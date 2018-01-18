<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CourseCollection extends ResourceCollection
{
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
            if (!is_null($item->teacher)) {
                $teacher           = $item->teacher;
                $teacher->titlepic = \Storage::url($item->teacher->titlepic);
            }
            $append         = [
                'category' => $item->category->map(function ($value) {
                    return [
                        'id'   => $value->id,
                        'type' => getCategoryName($value->type),
                        'name' => $value->name,
                    ];
                }),
                'teacher'  => $teacher,
            ];
            $item->titlepic = \Storage::url($item->titlepic);
            $result[]       = array_merge($item->toArray(), $append);

            return $item;
        });

        return $result;
    }
}
