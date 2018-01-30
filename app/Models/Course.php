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

    protected $hidden = ['created_at', 'updated_at', 'deleted_at'];

    /**
     * 课程所属分类
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function category()
    {
        return $this->belongsToMany(Category::class, 'category_has_class', 'class_id', 'category_id');
    }

    /**
     * @param array $ids
     * @param int $priceId
     * @return mixed
     */
    public function free($ids = [], $priceId)
    {
        //where(['category_id' => 9])->
        if (empty($priceId)) {
            $items = CourseCategory::whereIn('category_id', $ids)->get();
            $classId = $items->pluck('class_id')->toArray();
        } else {
            $items = CourseCategory::whereIn('category_id', $ids)->get();
            $priceItem = CourseCategory::where(['category_id' => $priceId])->get();
            $classId = $items->pluck('class_id')->intersect($priceItem->pluck('class_id')->toArray())->toArray();
        }


        return $this->whereIn('id', $classId);
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
