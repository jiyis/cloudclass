@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-course-index') !!}
    </section>

    <!-- Main content -->
    <section class="index-content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">课程列表</h3>
                        <a href="{{ route('admin.course.create') }}" class="btn btn-primary header-btn">新增课程</a>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered table-striped datatable">
                            <thead>
                            <tr>
                                <th>
                                    <label>
                                        <input type="checkbox" class="square" id="selectall">
                                    </label>
                                </th>
                                <th>课程名称</th>
                                <th>课时数</th>
                                <th>课程时间</th>
                                <th>课程图片</th>
                                <th>点击数</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($courses as $course)
                                <tr>
                                    <td>
                                        <label>
                                            <input type="checkbox" class="square selectall-item" name="id" id="id-{{ $course->id }}" value="{{ $course->id }}" />
                                        </label>
                                    </td>
                                    <td>{{ $course->name }}</td>
                                    <td>{{ $course->period }}</td>
                                    <td>{{ $course->minute }}</td>
                                    <td><img width="80" src="{{ Storage::url($course->titlepic) }}"></td>
                                    <td>{{ $course->click }}</td>
                                    <td>{{ $course->created_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.course.edit',['id'=>$course->id]) }}" class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>

                                        <a class="btn btn-danger btn-xs user-delete" data-href="{{ route('admin.course.destroy',['id'=>$course->id]) }}"><i class="fa fa-trash-o"></i> 删除</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('javascript')
    @parent
    <script type="text/javascript">

        $(".user-delete").click(function () {
            Rbac.ajax.delete({
                confirmTitle: '确定删除课程?',
                href: $(this).data('href'),
                successTitle: '课程删除成功'
            });
        });
    </script>
@endsection
