<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Repository\BannerRepository;
use Breadcrumbs, Toastr;

class BannerController extends Controller
{
    protected $banner;

    public function __construct(BannerRepository $banner)
    {
        parent::__construct();

        $this->banner = $banner;

        Breadcrumbs::register('admin-banner', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('banner管理', route('admin.banner.index'));
        });

    }

    public function index()
    {
        Breadcrumbs::register('admin-banner-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-banner');
            $breadcrumbs->push('banner列表', route('admin.banner.index'));
        });

        $banners = $this->banner->all();
        return view('admin.banner.index', compact('banners'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-banner-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-banner');
            $breadcrumbs->push('添加banner', route('admin.banner.create'));
        });
        return view('admin.banner.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $result = $this->banner->create($request->all());
        if(!$result) {
            Toastr::error('banner添加失败!');
            return redirect(route('admin.banner.create'));
        }
        Toastr::success('banner添加成功!');
        return redirect('admin/banner');
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
        Breadcrumbs::register('admin-banner-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-banner');
            $breadcrumbs->push('编辑banner', route('admin.banner.edit', ['id' => $id]));
        });

        $banner = $this->banner->find($id);

        return view('admin.banner.edit', compact('banner', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $banner = $this->banner->findWithoutFail($id);

        if (empty($banner)) {
            Toastr::error('banner未找到');

            return redirect(route('admin.banner.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $banner = $this->banner->update($data, $id);

        Toastr::success('banner更新成功.');

        return redirect(route('admin.banner.edit', $id));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $banner = $this->banner->findWithoutFail($id);
        if (empty($banner)) {
            Toastr::error('banner未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->banner->delete($id);
        //Toastr::success('banner删除成功');

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
            $result = $this->banner->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
