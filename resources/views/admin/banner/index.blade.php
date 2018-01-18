@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-banner-index') !!}
    </section>

    <!-- Main content -->
    <section class="index-content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">banner列表</h3>
                        <a href="{{ route('admin.banner.create') }}" class="btn btn-primary header-btn">新增banner</a>
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
                                <th>banner标题</th>
                                <th>banner图片</th>
                                <th>banner简介</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($banners as $banner)
                                <tr>
                                    <td>
                                        <label>
                                            <input type="checkbox" class="square selectall-item" name="id" id="id-{{ $banner->id }}" value="{{ $banner->id }}" />
                                        </label>
                                    </td>
                                    <td>{{ $banner->title }}</td>
                                    <td><img width="80" src="{{ Storage::url($banner->titlepic) }}"></td>
                                    <td>{!! $banner->description  !!}</td>
                                    <td>{{ $banner->created_at }}</td>
                                    <td>
                                        <a href="{{ route('admin.banner.edit',['id'=>$banner->id]) }}" class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>

                                        <a class="btn btn-danger btn-xs user-delete" data-href="{{ route('admin.banner.destroy',['id'=>$banner->id]) }}"><i class="fa fa-trash-o"></i> 删除</a>
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
                confirmTitle: '确定删除banner?',
                href: $(this).data('href'),
                successTitle: 'banner删除成功'
            });
        });
    </script>
@endsection
