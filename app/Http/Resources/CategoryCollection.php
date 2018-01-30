<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Http\Resources\Json\ResourceCollection;


class CategoryCollection extends ResourceCollection
{


    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->map(function ($item, $key) {
            return [
                'id'         => $item->id,
                'type'       => $item->type,
                'name'       => $item->name,
                'url'        => $item->url,
                'created_at' => $item->created_at->toDateString(),
            ];
        });

    }
}
