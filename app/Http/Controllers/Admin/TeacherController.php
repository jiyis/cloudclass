<?php

namespace App\Http\Controllers\Admin;

use App\Services\CommonService;
use Illuminate\Http\Request;
use App\Repository\TeacherRepository;
use App\Http\Requests\Admin\CreateTeacherRequest;
use App\Http\Requests\Admin\UpdateTeacherRequest;
use Breadcrumbs, Toastr;

class TeacherController extends Controller
{
    protected $teacher;

    public function __construct(TeacherRepository $teacher)
    {
        parent::__construct();
        $this->teacher = $teacher;

        Breadcrumbs::register('admin-teacher', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('教师管理', route('admin.teacher.index'));
        });
    }

    public function index()
    {
        Breadcrumbs::register('admin-teacher-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-teacher');
            $breadcrumbs->push('教师列表', route('admin.teacher.index'));
        });

        $teachers = $this->teacher->all();

        return view('admin.teacher.index', compact('teachers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-teacher-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-teacher');
            $breadcrumbs->push('添加教师', route('admin.teacher.create'));
        });
        return view('admin.teacher.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateTeacherRequest $request)
    {

        $result = $this->teacher->create($request->all());
        if(!$result) {
            Toastr::error('新教师添加失败!');
            return redirect(route('admin.teacher.create'));
        }
        Toastr::success('新教师添加成功!');
        return redirect('admin/teacher');
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
        Breadcrumbs::register('admin-teacher-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-teacher');
            $breadcrumbs->push('编辑教师', route('admin.teacher.edit', ['id' => $id]));
        });

        $teacher = $this->teacher->find($id);

        //获取已购买的课程
        $teacher->courses = $teacher->course;

        return view('admin.teacher.edit', compact('teacher'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTeacherRequest $request, $id)
    {
        $user = $this->teacher->findWithoutFail($id);

        if (empty($user)) {
            Toastr::error('教师未找到');

            return redirect(route('admin.teacher.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $user = $this->teacher->update($data, $id);

        Toastr::success('教师更新成功.');

        return redirect(route('admin.teacher.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = $this->teacher->findWithoutFail($id);
        if (empty($user)) {
            Toastr::error('教师未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->teacher->delete($id);
        //Toastr::success('教师删除成功');

        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }

    /**
     * Delete multi teacher
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroyAll(Request $request)
    {
        if(!($ids = $request->get('ids', []))) {
            return response()->json(['status' => 0, 'msg' => '请求参数错误']);
        }

        foreach($ids as $id){
            $result = $this->teacher->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
