@section('css')
    <link href="/assets/dropzone/dropzone.min.css" rel="stylesheet">
    @parent
    <link rel="stylesheet" type="text/css"
          href="/assets/datetimepicker/bootstrap-datepicker.min.css">
    <style type="text/css">
        #remarks {
            overflow: hidden;
        }
    </style>
@endsection
@include('vendor.ueditor.assets')
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <i class="fa fa-edit"></i>
                <h3 class="box-title"> 单页编辑</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('name', '单页名称',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('name', old('name'), ['class' => 'form-control','placeholder' => '请填写单页名称']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('url', '单页路由',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('url', old('url'), ['class' => 'form-control','placeholder' => '请填写单页url: 例如news']) !!}
                        </div>
                    </div>


                    <div class="form-group">
                        {!! Form::label('content', '单页内容',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('content', old('content'), ['class' => 'tooltips','id' => 'content','placeholder' => '请填写单页简介']) !!}
                        </div>
                    </div>

                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->

            <div class="panel-footer">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-10">
                        <button class="btn bg-blue">保存</button>
                        &nbsp;
                        <a href="{{ route('admin.category.index') }}" class="btn btn-default">取消</a>
                    </div>
                </div>
            </div><!-- panel-footer -->
        </div>
    </div>
</div>

@section('javascript')
    @parent
    <script type="text/javascript">

        var ue = UE.getEditor('content', {
            /*toolbars: [
             ['fullscreen', 'source', 'undo', 'redo', 'bold']
             ],*/
            initialFrameHeight: 420,
            autoHeightEnabled: false,
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}'); // 设置 CSRF token.
        });

    </script>
@endsection