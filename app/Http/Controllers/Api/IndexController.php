<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Http\Resources\BannerCollection;
use App\Models\Banner;
use App\Repository\CourseRepository;
use Illuminate\Http\Request;

class IndexController extends Controller
{

    public $repository;

    public function __construct(CourseRepository $repository)
    {
        $this->repository = $repository;
    }

    public function banner(Request $request)
    {
        $banners = Banner::all();
        return new BannerCollection($banners);
    }

    public function search(Request $request)
    {
        $course = $this->repository->all(['id', 'name']);
        return response()->json($course->toArray());
    }

}