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
                <h3 class="box-title"> 课程编辑</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('name', '课程名称',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('name', old('name'), ['class' => 'form-control','placeholder' => '请填写课程名称']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('period', '课时数',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4 ">
                            {!! Form::number('period', old('period'), ['class' => 'form-control','placeholder' => '请填写课时']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('minute', '课程时长',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4 ">
                            {!! Form::number('minute', old('minute'), ['class' => 'form-control','placeholder' => '请填写课程时长']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('titlepic', '课程标题图片',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-6 ">
                            <div id="project-files" class="dropzone dropzone-pic" ></div>
                            {!! Form::hidden('titlepic', old('titlepic'), ['id' => 'userpicval']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('description', '课程简介',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('description', old('description'), ['class' => 'tooltips','id' => 'description','placeholder' => '请填写课程简介']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('target', '课程目标',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('target', old('target'), ['class' => 'tooltips','id' => 'target','placeholder' => '请填写课程目标']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('syllabus', '课程大纲',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('syllabus', old('syllabus'), ['class' => 'tooltips','id' => 'syllabus','placeholder' => '请填写课程大纲']) !!}

                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('content', '课程内容',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('content',  old('content'), ['class' => 'tooltips','id' => 'content']) !!}
                        </div>
                    </div>

                    @foreach($categories as $label => $item)
                        <div class="form-group">
                            {!! Form::label('category_'.getCategoryName($label, 'value'), getCategoryName($label),['class'=>'col-sm-2 control-label']) !!}
                            <div class="col-sm-4 ">
                                @if(getCategoryName($label, 'type') != 'multi')
                                {!! Form::select('category[]', $item, null, ['class' => 'form-control select2']) !!}
                                @else
                                    {!! Form::select('category[]', $item, null, ['class' => 'form-control multi-placeholder', 'multiple' => 'multiple']) !!}
                                @endif
                            </div>
                        </div>
                    @endforeach

                    <div class="form-group">
                        {!! Form::label('teacher_id', '授课老师', ['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4 ">
                            {!! Form::select('teacher_id', $teachers, null, ['class' => 'form-control select2']) !!}
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
                        <a href="{{ route('admin.course.index') }}" class="btn btn-default">取消</a>
                    </div>
                </div>
            </div><!-- panel-footer -->
        </div>
    </div>
</div>

@section('javascript')
    @parent
    <script type="text/javascript" src="/assets/dropzone/dropzone.min.js"></script>
    <script type="text/javascript" src="/assets/datetimepicker/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/assets/datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
    <script type="text/javascript">
        $('.datetimepicker').datepicker({
            language: 'zh-CN',
            autoclose: true,
            format: 'yyyy-mm-dd'
        });

        $(function() {
            $(".multi-placeholder").select2({
                placeholder: "全部",
            });
        })


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

        var ue = UE.getEditor('description', {
            /*toolbars: [
             ['fullscreen', 'source', 'undo', 'redo', 'bold']
             ],*/
            initialFrameHeight: 420,
            autoHeightEnabled: false,
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}'); // 设置 CSRF token.
        });

        var ue = UE.getEditor('target', {
            /*toolbars: [
             ['fullscreen', 'source', 'undo', 'redo', 'bold']
             ],*/
            initialFrameHeight: 420,
            autoHeightEnabled: false,
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}'); // 设置 CSRF token.
        });

        var ue = UE.getEditor('syllabus', {
            /*toolbars: [
             ['fullscreen', 'source', 'undo', 'redo', 'bold']
             ],*/
            initialFrameHeight: 420,
            autoHeightEnabled: false,
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}'); // 设置 CSRF token.
        });


        Dropzone.autoDiscover = false;//防止报"Dropzone already attached."的错误
        $(".dropzone").dropzone({
            url: "{!! route('admin.upload.uploadfile') !!}",
            method: "post",
            addRemoveLinks: true,
            dictDefaultMessage: "<span style='line-height: 50px; margin-top: 30px;'>点击或者拖拽<br>标题图片上传</span>",
            dictRemoveLinks: "x",
            dictRemoveFile: '移除文件',
            maxFiles: 1,
            maxFilesize: 20,
            //autoDiscover:false,
            acceptedFiles: "image/*",
            sending: function (file, xhr, formData) {
                formData.append("_token", $('[name=_token]').val());
                formData.append("details", JSON.stringify($('#'+this.element.id).data('details')));
            },
            init: function () {
                //如果已经上传，显示出来
                var myDropzone = this;
                if($('#userpicval').val() != ""){
                    var mockFile = { name: '课程图片' };
                    myDropzone.options.addedfile.call(myDropzone, mockFile);
                    myDropzone.options.thumbnail.call(myDropzone, mockFile, "{{ Storage::url('/') }}"+$('#userpicval').val());
                    $('.dz-progress').remove();
                    $('.dz-size').empty();
                }
                this.on("success", function (file, result) {
                    if(result.code == '0'){
                        swal({title:'上传失败，错误原因：'+result.msg,confirmButtonColor: "#DD6B55"});
                        myDropzone.removeFile(file);
                        return false;
                    }
                    $('#userpicval').val(result.path);
                });
                this.on("removedfile", function (file) {
                    console.log("上传头像失败");
                    toastr.error('上传头像失败');
                });
            }
        });

    </script>
@endsection