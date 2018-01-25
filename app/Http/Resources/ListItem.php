<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;


class ListItem extends Resource
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
        $this->titlepic = \Storage::url($this->titlepic);
        return [
            'id'          => $this->id,
            'title'       => $this->title,
            'category'    => $this->cate->name,
            'titlepic'    => asset($this->titlepic),
            'description' => $this->description,
            'content'     => $this->content,
            'created_at'  => $this->created_at->toDateString(),
        ];
    }
}
