<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <i class="fa fa-edit"></i>
                <h3 class="box-title"> 分类编辑</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('name', '类别名称',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('name', old('name'), ['class' => 'form-control','placeholder' => '请填写类别名称']) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('type', '类别分类',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4 ">
                            {!! Form::select('type', getSelectCategory(), null, ['class' => 'form-control select2']) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('url', '类别url',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('url', old('url'), ['class' => 'form-control','placeholder' => '请填写类别url']) !!}
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
