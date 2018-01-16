<?php

namespace App\Http\Controllers\Admin;

use App\Services\CommonService;
use Illuminate\Http\Request;
use App\Repository\PageRepository;
use App\Http\Requests\Admin\CreatePageRequest;
use App\Http\Requests\Admin\UpdatePageRequest;
use Breadcrumbs, Toastr;

class PageController extends Controller
{
    protected $page;

    public function __construct(PageRepository $page)
    {
        parent::__construct();

        $this->page = $page;

        Breadcrumbs::register('admin-page', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('单页管理', route('admin.page.index'));
        });

    }

    public function index()
    {
        Breadcrumbs::register('admin-page-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-page');
            $breadcrumbs->push('单页列表', route('admin.page.index'));
        });

        $pages = $this->page->all();
        return view('admin.page.index', compact('pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-page-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-page');
            $breadcrumbs->push('添加单页', route('admin.page.create'));
        });
        return view('admin.page.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePageRequest $request)
    {
        $result = $this->page->create($request->all());
        if(!$result) {
            Toastr::error('单页添加失败!');
            return redirect(route('admin.page.create'));
        }
        Toastr::success('单页添加成功!');
        return redirect('admin/page');
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        Breadcrumbs::register('admin-page-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-page');
            $breadcrumbs->push('编辑单页', route('admin.page.edit', ['id' => $id]));
        });

        $page = $this->page->find($id);

        return view('admin.page.edit', compact('page', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePageRequest $request, $id)
    {
        $page = $this->page->findWithoutFail($id);

        if (empty($page)) {
            Toastr::error('单页未找到');

            return redirect(route('admin.page.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $page = $this->page->update($data, $id);

        Toastr::success('单页更新成功.');

        return redirect(route('admin.page.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $page = $this->page->findWithoutFail($id);
        if (empty($page)) {
            Toastr::error('单页未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->page->delete($id);
        //Toastr::success('单页删除成功');

        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }

    /**
     * Delete multi categories
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroyAll(Request $request)
    {
        if(!($ids = $request->get('ids', []))) {
            return response()->json(['status' => 0, 'msg' => '请求参数错误']);
        }

        foreach($ids as $id){
            $result = $this->page->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
