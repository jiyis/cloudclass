<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{

    use SoftDeletes;

    protected $table = 'category';

    protected $fillable = ['name', 'type', 'url'];

    /**
     * 分类下的课程
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function course()
    {
        return $this->belongsToMany(Course::class, 'category_has_class', 'category_id', 'class_id');
    }

}
