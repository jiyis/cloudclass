<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ListCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->mapWithKeys(function ($item, $key) {
            return [
                $key => [
                    'id'          => $item->id,
                    'title'       => $item->title,
                    'category'    => $item->cate->name,
                    'titlepic'    => \Storage::url($item->titlepic),
                    'description' => $item->description,
                    'content'     => $item->content,
                    'created_at'  => $item->created_at->toDateString(),
                ],
            ];
        });
    }
}
