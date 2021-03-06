@section('css')
    <link href="/assets/dropzone/dropzone.min.css" rel="stylesheet">
    @parent
@endsection
@include('vendor.ueditor.assets')
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <i class="fa fa-edit"></i>
                <h3 class="box-title"> 教师编辑</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('name', '用户名',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-4">
                            {!! Form::text('name', old('name'), ['class' => 'form-control','placeholder' => '请填写教师名称']) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('titlepic', '教师头像',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-6 ">
                            <div id="project-files" class="dropzone dropzone-pic" ></div>
                            {!! Form::hidden('titlepic', old('titlepic'), ['id' => 'userpicval']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('description', '教师简介',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-9">
                            {!! Form::textarea('description', old('description'), ['class' => 'tooltips','id' => 'description','placeholder' => '请填写列表简介']) !!}
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
                        <a href="{{ route('admin.teacher.index') }}" class="btn btn-default">取消</a>
                    </div>
                </div>
            </div><!-- panel-footer -->
        </div>
    </div>
</div>
@section('javascript')
    @parent
    <script type="text/javascript" src="/assets/dropzone/dropzone.min.js"></script>
    <script type="text/javascript">

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
                    var mockFile = { name: '列表图片' };
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