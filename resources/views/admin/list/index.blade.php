@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-list-index') !!}
    </section>

    <!-- Main content -->
    <section class="index-content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">列表列表</h3>
                        <a href="{{ route('admin.list.create') }}" class="btn btn-primary header-btn">新增列表</a>
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
                                <th>列表名称</th>
                                <th>列表栏目</th>
                                <th>列表图片</th>
                                <th>列表简介</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($lists as $list)
                                <tr>
                                    <td>
                                        <label>
                                            <input type="checkbox" class="square selectall-item" name="id" id="id-{{ $list->id }}" value="{{ $list->id }}" />
                                        </label>
                                    </td>
                                    <td>{{ $list->title }}</td>
                                    <td>{{ $list->category }}</td>
                                    <td><img width="80" src="{{ Storage::url($list->titlepic) }}"></td>
                                    <td>{!! $list->description !!}</td>
                                    <td>{{ $list->created_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.list.edit',['id'=>$list->id]) }}" class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>

                                        <a class="btn btn-danger btn-xs user-delete" data-href="{{ route('admin.list.destroy',['id'=>$list->id]) }}"><i class="fa fa-trash-o"></i> 删除</a>
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
                confirmTitle: '确定删除列表?',
                href: $(this).data('href'),
                successTitle: '列表删除成功'
            });
        });
    </script>
@endsection
