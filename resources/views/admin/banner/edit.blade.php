@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-banner-edit') !!}
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::model($banner, ['route' => ['admin.banner.update', $banner],'class' => '', 'method' => 'patch', 'files' => true ]) !!}

                @include('admin.banner.fields')

                {!! Form::close() !!}
            </div>
        </div>
    </section>
@endsection