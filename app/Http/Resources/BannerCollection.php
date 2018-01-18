<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class BannerCollection extends ResourceCollection
{
    public function __construct($resource)
    {
        parent::__construct($resource);
        static::$wrap = null;
    }

    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->map(function ($item) {
            $item->titlepic = \Storage::url($item->titlepic);
            return [
                'id'          => $item->id,
                'title'       => $item->title,
                'titlepic'    => \Storage::url($item->titlepic),
                'description' => $item->description,
                'created_at'  => $item->created_at->toDateString(),

            ];
        });
        return parent::toArray($request);
    }
}
