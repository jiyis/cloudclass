<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 17-11-13
 * Time: 下午2:32
 * Desc:
 */

namespace App\Repository;


use App\Criteria\MemberCriteria;
use App\Models\Teacher;


class TeacherRepository extends BaseRepository
{

    public function model()
    {
        return Teacher::class;
    }

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        parent::boot();
        //$this->pushCriteria(app(MemberCriteria::class));

    }
}