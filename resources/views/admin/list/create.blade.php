@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-list-create') !!}
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::open(['route' => 'admin.list.store','class' => '']) !!}

                @include('admin.list.fields')

                {!! Form::close() !!}

            </div>
        </div>
    </section>
@endsection

