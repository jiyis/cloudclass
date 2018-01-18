<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Http\Resources\ListCollection;
use App\Models\Lists;
use App\Repository\CategoryRepository;
use App\Repository\ListRepository;
use Illuminate\Http\Request;

class ListController extends Controller
{

    public $repository;

    public function __construct(ListRepository $repository)
    {
        $this->repository = $repository;
    }

    public function index(Request $request, $url)
    {
        //先获取type id
        $category = app(CategoryRepository::class)->findWhere(['url' => $url])->first();
        $lists = Lists::where(['category' => $category->id])->paginate(10);

        return new ListCollection($lists);
    }

}