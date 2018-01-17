<?php

namespace App\Models;

use App\User;
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
            'teacher_id',
        ];

    /**
     * 课程所属分类
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function category()
    {
        return $this->belongsToMany(Category::class, 'category_has_class', 'class_id', 'category_id');
    }

    /**
     * 付费课程购买人
     */
    public function user()
    {
        return $this->belongsToMany(User::class, 'member_has_courses', 'class_id', 'user_id');
    }

    /**
     *  主讲老师
     */
    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id', 'id');
    }


}
