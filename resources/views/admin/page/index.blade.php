@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-page-index') !!}
    </section>

    <!-- Main content -->
    <section class="index-content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">单页列表</h3>
                        <a href="{{ route('admin.page.create') }}" class="btn btn-primary header-btn">新增单页</a>
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
                                <th>单页名称</th>
                                <th>单页路由</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($pages as $page)
                                <tr>
                                    <td>
                                        <label>
                                            <input type="checkbox" class="square selectall-item" name="id" id="id-{{ $page->id }}" value="{{ $page->id }}" />
                                        </label>
                                    </td>
                                    <td>{{ $page->name }}</td>
                                    <td>{{ $page->url }}</td>
                                    <td>{{ $page->created_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.page.edit',['id'=>$page->id]) }}" class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>

                                        <a class="btn btn-danger btn-xs user-delete" data-href="{{ route('admin.page.destroy',['id'=>$page->id]) }}"><i class="fa fa-trash-o"></i> 删除</a>
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
                confirmTitle: '确定删除单页?',
                href: $(this).data('href'),
                successTitle: '单页删除成功'
            });
        });
    </script>
@endsection
