@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-banner-create') !!}
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::open(['route' => 'admin.banner.store','class' => '']) !!}

                @include('admin.banner.fields')

                {!! Form::close() !!}

            </div>
        </div>
    </section>
@endsection

