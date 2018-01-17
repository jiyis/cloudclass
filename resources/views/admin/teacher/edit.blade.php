@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-teacher-edit') !!}
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::model($teacher, ['route' => ['admin.teacher.update', $teacher],'class' => '', 'method' => 'patch', 'files' => true ]) !!}

                @include('admin.teacher.fields')

                {!! Form::close() !!}
            </div>
        </div>
    </section>
@endsection