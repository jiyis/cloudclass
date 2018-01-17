@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-teacher-index') !!}
    </section>

    <!-- Main content -->
    <section class="index-content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">教师列表</h3>
                        <a href="{{ route('admin.teacher.create') }}" class="btn btn-primary header-btn">新增教师</a>
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
                                <th>教师名称</th>
                                <th>教师头像</th>
                                <th>教师简介</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($teachers as $teacher)
                                <tr>
                                    <td>
                                        <label>
                                            <input type="checkbox" class="square selectall-item" name="id" id="id-{{ $teacher->id }}" value="{{ $teacher->id }}" />
                                        </label>
                                    </td>
                                    <td>{{ $teacher->name }}</td>
                                    <td><img width="80" src="{{ Storage::url($teacher->titlepic) }}"></td>
                                    <td>{{ $teacher->description }}</td>
                                    <td>{{ $teacher->created_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.teacher.edit',['id'=>$teacher->id]) }}" class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>

                                        <a class="btn btn-danger btn-xs user-delete" data-href="{{ route('admin.teacher.destroy',['id'=>$teacher->id]) }}"><i class="fa fa-trash-o"></i> 删除</a>
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
        $('input[class!="my-switch"]').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
        $(".user-delete").click(function () {
            Rbac.ajax.delete({
                confirmTitle: '确定删除教师?',
                href: $(this).data('href'),
                successTitle: '教师删除成功'
            });
        });
    </script>
@endsection
