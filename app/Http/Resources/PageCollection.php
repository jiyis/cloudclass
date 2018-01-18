<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;


class PageCollection extends Resource
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
        return [
            'id'         => $this->id,
            'name'       => $this->name,
            'titlepic'   => \Storage::url($this->titlepic),
            'content'    => $this->content,
            'created_at' => $this->created_at->toDateString(),
        ];
    }
}
