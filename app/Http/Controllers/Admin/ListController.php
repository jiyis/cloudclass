<?php

namespace App\Http\Controllers\Admin;


use App\Services\CommonService;
use Illuminate\Http\Request;
use App\Repository\ListRepository;
use App\Http\Requests\Admin\CreateListRequest;
use App\Http\Requests\Admin\UpdateListRequest;
use Breadcrumbs, Toastr;

class ListController extends Controller
{
    protected $list;

    public function __construct(ListRepository $list)
    {
        parent::__construct();

        $this->list = $list;

        Breadcrumbs::register('admin-list', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('列表管理', route('admin.list.index'));
        });
        view()->share('category', CommonService::getCategoryById(4));
    }

    public function index()
    {
        Breadcrumbs::register('admin-list-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-list');
            $breadcrumbs->push('列表列表', route('admin.list.index'));
        });

        $lists = $this->list->all();
        return view('admin.list.index', compact('lists'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-list-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-list');
            $breadcrumbs->push('添加列表', route('admin.list.create'));
        });
        return view('admin.list.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateListRequest $request)
    {
        $result = $this->list->create($request->all());
        if(!$result) {
            Toastr::error('列表添加失败!');
            return redirect(route('admin.list.create'));
        }
        Toastr::success('列表添加成功!');
        return redirect('admin/list');
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
        Breadcrumbs::register('admin-list-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-list');
            $breadcrumbs->push('编辑列表', route('admin.list.edit', ['id' => $id]));
        });

        $list = $this->list->find($id);

        return view('admin.list.edit', compact('list', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateListRequest $request, $id)
    {
        $list = $this->list->findWithoutFail($id);

        if (empty($list)) {
            Toastr::error('列表未找到');

            return redirect(route('admin.list.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $list = $this->list->update($data, $id);

        Toastr::success('列表更新成功.');

        return redirect(route('admin.list.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $list = $this->list->findWithoutFail($id);
        if (empty($list)) {
            Toastr::error('列表未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->list->delete($id);
        //Toastr::success('列表删除成功');

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
            $result = $this->list->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
