@extends('admin.layouts.layout')

@section('content')
    <section class="content-header">
        {!! Breadcrumbs::render('admin-list-edit') !!}
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">

                {!! Form::model($list, ['route' => ['admin.list.update', $list],'class' => '', 'method' => 'patch', 'files' => true ]) !!}

                @include('admin.list.fields')

                {!! Form::close() !!}
            </div>
        </div>
    </section>
@endsection