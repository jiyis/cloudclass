<?php

namespace App\Http\Resources;

use App\Services\Traits\CourseCheck;
use Illuminate\Http\Resources\Json\Resource;


class CourseItem extends Resource
{
    use CourseCheck;

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
        $this->titlepic          = \Storage::url($this->titlepic);
        $this->teacher->titlepic = asset(\Storage::url($this->teacher->titlepic));
        $priceType               = $this->category->filter(function ($item) {
            return $item->type == 10;
        })->isEmpty();

        $data = [
            'id'          => $this->id,
            'name'        => $this->name,
            'period'      => $this->period,
            'minute'      => $this->minute,
            'titlepic'    => asset($this->titlepic),
            'description' => $this->description,
            'target'      => $this->target,
            'syllabus'    => $this->syllabus,
            'click'       => $this->click,
            'teacher'     => $this->teacher,
            'category'    => $this->category,
            'created_at'  => $this->created_at->toDateString(),
        ];
        //如果是付费课程，并且登录了
        if ($priceType && config('user') && $this->check(config('user'), $data)) {
            $data['content'] = $this->content;
        }
        return $data;
    }
}
