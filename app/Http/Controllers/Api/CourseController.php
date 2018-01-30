<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Criteria\CourseCriteria;
use App\Http\Resources\CourseCollection;
use App\Http\Resources\CourseItem;
use App\Repository\CourseRepository;
use Illuminate\Http\Request;
use Prettus\Repository\Criteria\RequestCriteria;

class CourseController extends Controller
{

    public $repository;

    public function __construct(CourseRepository $repository)
    {
        $this->repository = $repository;
        $this->repository->pushCriteria(app(CourseCriteria::class));
    }

    public function index(Request $request)
    {
        $warp = 'data';
        if (!empty($limit = $request->input('limit'))) {
            $course = $this->repository->makeModel()->take($limit)->get();
            $warp = null;
        } else {
            $course = $this->repository->paginate(10);
        }

        return new CourseCollection($course, $warp);
    }

    public function search(Request $request)
    {
        $this->repository->pushCriteria(new RequestCriteria($request));
        $course = $this->repository->paginate(10);
        return new CourseCollection($course);
    }

    public function show(Request $request, $id)
    {
        $course = $this->repository->find($id);
        return new CourseItem($course);
    }

}