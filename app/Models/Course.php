<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Course extends Model
{

    use SoftDeletes;

    protected $table = 'class';

    protected $fillable
        = [
            'name',
            'period',
            'minute',
            'titlepic',
            'description',
            'target',
            'syllabus',
            'content',
            'click',
        ];

    /**
     * 课程所属分类
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function category()
    {
        return $this->belongsToMany(Category::class, 'category_has_class', 'class_id', 'category_id');
    }


}
