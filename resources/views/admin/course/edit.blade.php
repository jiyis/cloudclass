@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-course-edit') !!}
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::model($course, ['route' => ['admin.course.update', $course],'class' => '', 'method' => 'patch', 'files' => true ]) !!}

                @include('admin.course.fields')

                {!! Form::close() !!}
            </div>
        </div>
    </section>
@endsection