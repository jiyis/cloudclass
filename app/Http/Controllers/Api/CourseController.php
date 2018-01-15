<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Repository\CourseRepository;
use Dingo\Api\Http\Request;

class CourseController extends Controller
{

    public $repository;

    public function __construct(CourseRepository $repository)
    {
        $this->repository = $repository;
    }

    public function index(Request $request)
    {
        $course = $this->repository->all();
        return response()->json($course->toArray());
    }

    public function list(Request $request)
    {
        $course = $this->repository->all(['id', 'name']);
        return response()->json($course->toArray());
    }

}