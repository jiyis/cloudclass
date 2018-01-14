<?php

namespace App\Http\Controllers\Admin;

use App\Repository\CategoryRepository;
use App\Services\CommonService;
use Illuminate\Http\Request;
use App\Repository\CourseRepository;
use App\Http\Requests\Admin\CreateCourseRequest;
use App\Http\Requests\Admin\UpdateCourseRequest;
use Breadcrumbs, Toastr;

class CourseController extends Controller
{
    protected $course;

    public function __construct(CourseRepository $course)
    {
        parent::__construct();

        $this->course = $course;

        Breadcrumbs::register('admin-course', function ($breadcrumbs) {
            $breadcrumbs->parent('控制台');
            $breadcrumbs->push('课程管理', route('admin.course.index'));
        });

        view()->share('categories', CommonService::getAllCategory());
    }

    public function index()
    {
        Breadcrumbs::register('admin-course-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-course');
            $breadcrumbs->push('课程列表', route('admin.course.index'));
        });

        $courses = $this->course->all();
        return view('admin.course.index', compact('courses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumbs::register('admin-course-create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-course');
            $breadcrumbs->push('添加课程', route('admin.course.create'));
        });
        return view('admin.course.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateCourseRequest $request)
    {
        $result = $this->course->create($request->all());
        if(!$result) {
            Toastr::error('课程添加失败!');
            return redirect(route('admin.course.create'));
        }
        Toastr::success('课程添加成功!');
        return redirect('admin/course');
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
        Breadcrumbs::register('admin-course-edit', function ($breadcrumbs) use ($id) {
            $breadcrumbs->parent('admin-course');
            $breadcrumbs->push('编辑课程', route('admin.course.edit', ['id' => $id]));
        });

        $course = $this->course->find($id);

        return view('admin.course.edit', compact('course', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCourseRequest $request, $id)
    {
        $course = $this->course->findWithoutFail($id);

        if (empty($course)) {
            Toastr::error('课程未找到');

            return redirect(route('admin.course.index'));
        }
        if($request->get('password') == ''){
            $data = $request->except('password');
        }else{
            $data = $request->all();
        }
        $course = $this->course->update($data, $id);

        Toastr::success('课程更新成功.');

        return redirect(route('admin.course.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $course = $this->course->findWithoutFail($id);
        if (empty($course)) {
            Toastr::error('课程未找到');

            return response()->json(['status' => 0]);
        }
        $result = $this->course->delete($id);
        //Toastr::success('课程删除成功');

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
            $result = $this->course->delete($id);
        }
        return response()->json($result ? ['status' => 1] : ['status' => 0]);
    }
}
