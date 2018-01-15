<?php

namespace App\Http\Controllers\Admin;

use App\Repository\CourseRepository;
use App\Services\CommonService;
use Illuminate\Http\Request;
use App\Repository\MemberRepository;
use App\Http\Requests\Admin\CreateMemberRequest;
use App\Http\Requests\Admin\UpdateMemberRequest;
use Breadcrumbs, Toastr;

class MemberController extends Controller
{
    protected $member;

    public function __construct(MemberRepository $member)
    {
        parent::__construct();
        $this->member = $member;

        Breadcrumbs::register('admin-member', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('会员管理', route('admin.member.index'));
        });

        view()->share('courses', CommonService::getAllPayCourses());
    }

    public function index()
    {
        Breadcrumbs::register('admin-member-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-member');
            $breadcrumbs->push('会员列表', route('admin.member.index'));
        });

        $members = $this->member->all();

        return view('admin.member.index', compact('members'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-member-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-member');
            $breadcrumbs->push('添加会员', route('admin.member.create'));
        });
        return view('admin.member.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateMemberRequest $request)
    {

        $result = $this->member->create($request->all());
        if(!$result) {
            Toastr::error('新会员添加失败!');
            return redirect(route('admin.member.create'));
        }
        Toastr::success('新会员添加成功!');
        return redirect('admin/member');
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
        Breadcrumbs::register('admin-member-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-member');
            $breadcrumbs->push('编辑会员', route('admin.member.edit', ['id' => $id]));
        });

        $member = $this->member->find($id);

        //获取已购买的课程
        $member->courses = $member->course;

        return view('admin.member.edit', compact('member'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMemberRequest $request, $id)
    {
        $user = $this->member->findWithoutFail($id);

        if (empty($user)) {
            Toastr::error('会员未找到');

            return redirect(route('admin.member.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $user = $this->member->update($data, $id);

        Toastr::success('会员更新成功.');

        return redirect(route('admin.member.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = $this->member->findWithoutFail($id);
        if (empty($user)) {
            Toastr::error('会员未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->member->delete($id);
        //Toastr::success('会员删除成功');

        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }

    /**
     * Delete multi member
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroyAll(Request $request)
    {
        if(!($ids = $request->get('ids', []))) {
            return response()->json(['status' => 0, 'msg' => '请求参数错误']);
        }

        foreach($ids as $id){
            $result = $this->member->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
