<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-30
 * Time: 下午1:53
 * Desc:
 */

namespace App\Services\Traits;


use Illuminate\Database\Eloquent\Model;

trait CourseCheck
{
    /**
     * 校验该用户是否有的课程权限
     * @param Model $user
     * @param array $course
     * @return bool
     */
    public function check(Model $user, array $course)
    {
        if (in_array($course['id'], $user->course->pluck('id')->toArray())) {
            return true;
        }
        return false;
    }
}