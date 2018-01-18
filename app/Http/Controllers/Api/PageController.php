<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Http\Resources\PageCollection;
use App\Repository\PageRepository;
use Illuminate\Http\Request;

class PageController extends Controller
{

    public $repository;

    public function __construct(PageRepository $repository)
    {
        $this->repository = $repository;
    }

    public function index(Request $request, $url)
    {
        $page = $this->repository->findWhere(['url' => $url])->first();

        return new PageCollection($page);
    }

}