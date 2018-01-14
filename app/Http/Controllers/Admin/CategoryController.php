<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Repository\CategoryRepository;
use App\Http\Requests\Admin\CreateCategoryRequest;
use App\Http\Requests\Admin\UpdateCategoryRequest;
use Breadcrumbs, Toastr;

class CategoryController extends Controller
{
    protected $category;

    public function __construct(CategoryRepository $admincategory)
    {
        parent::__construct();
        $this->category = $admincategory;

        Breadcrumbs::register('admin-category', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('分类管理', route('admin.category.index'));
        });
    }

    public function index()
    {
        Breadcrumbs::register('admin-category-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-category');
            $breadcrumbs->push('分类列表', route('admin.category.index'));
        });

        $categories = $this->category->all();
        return view('admin.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-category-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-category');
            $breadcrumbs->push('添加分类', route('admin.category.create'));
        });
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateCategoryRequest $request)
    {
        $result = $this->category->create($request->all());
        if(!$result) {
            Toastr::error('分类添加失败!');
            return redirect(route('admin.category.create'));
        }
        Toastr::success('分类添加成功!');
        return redirect('admin/category');
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
        Breadcrumbs::register('admin-category-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-category');
            $breadcrumbs->push('编辑分类', route('admin.category.edit', ['id' => $id]));
        });

        $category = $this->category->find($id);

        return view('admin.category.edit', compact('category', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCategoryRequest $request, $id)
    {
        $category = $this->category->findWithoutFail($id);

        if (empty($category)) {
            Toastr::error('分类未找到');

            return redirect(route('admin.category.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $category = $this->category->update($data, $id);

        Toastr::success('分类更新成功.');

        return redirect(route('admin.category.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = $this->category->findWithoutFail($id);
        if (empty($category)) {
            Toastr::error('分类未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->category->delete($id);
        //Toastr::success('分类删除成功');

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
            $result = $this->category->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
