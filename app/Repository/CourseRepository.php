<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 17-11-13
 * Time: 下午2:32
 * Desc:
 */

namespace App\Repository;


use App\Models\Course;


class CourseRepository extends BaseRepository
{

    public function model()
    {
        return Course::class;
    }

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        parent::boot();
        //$this->pushCriteria(app(MemberCriteria::class));

    }

    /**
     * @param array $attributes
     * @return mixed
     */
    public function create(array $attributes)
    {
        return tap(parent::create($attributes), function ($course) use ($attributes) {
            $course->category()->sync($attributes['category']);
        });
    }

    /**
     * @param array $attributes
     * @return mixed
     */
    public function update(array $attributes, $id)
    {
        return tap(parent::update($attributes, $id), function ($course) use ($attributes) {
            $course->category()->sync($attributes['category']);
        });
    }

}