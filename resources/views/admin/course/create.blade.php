@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-course-create') !!}
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::open(['route' => 'admin.course.store','class' => '']) !!}

                @include('admin.course.fields')

                {!! Form::close() !!}

            </div>
        </div>
    </section>
@endsection

