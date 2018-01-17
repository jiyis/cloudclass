<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teacher extends Model
{

    use SoftDeletes;

    protected $table = 'teachers';

    protected $fillable
        = [
            'name',
            'titlepic',
            'description',
        ];

    /**
     * 教师所教课程
     */
    public function course()
    {
        return $this->hasMany(Course::class, 'teacher_id', 'id');
    }


}
