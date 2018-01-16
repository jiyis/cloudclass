<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 17-11-13
 * Time: 下午2:32
 * Desc:
 */

namespace App\Repository;


use App\Models\Page;


class PageRepository extends BaseRepository
{

    public function model()
    {
        return Page::class;
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