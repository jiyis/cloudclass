<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['namespace' => 'Admin', 'prefix' => 'admin'], function () {
    Route::get('login', 'Auth\LoginController@showLoginForm');
    Route::post('login', 'Auth\LoginController@login');
    Route::get('logout', 'Auth\LoginController@logout');
});

Route::group(['namespace' => 'Admin', 'prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'auth.admin:admin'], function () {

    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/center', 'HomeController@center')->name('center');
    Route::patch('/center', 'HomeController@update')->name('center.update');

    //用户设置以及权限
    Route::resource('users', 'UserController');
    Route::post('users/destroyall', ['as' => 'users.destroy.all', 'uses' => 'UserController@destroyAll']);
    Route::resource('role', 'RoleController');
    Route::post('role/destroyall', ['as' => 'role.destroy.all', 'uses' => 'RoleController@destroyAll']);
    Route::get('role/{id}/permissions', ['as' => 'role.permissions', 'uses' => 'RoleController@permissions']);
    Route::post('role/{id}/permissions', ['as' => 'role.permissions', 'uses' => 'RoleController@storePermissions']);
    Route::resource('permission', 'PermissionController');
    Route::post('permission/destroyall', ['as' => 'permission.destroy.all', 'uses' => 'PermissionController@destroyAll']);

    //日志管理
    Route::get('operation/log',['as'=>'operationlog.index','uses'=>'LogController@operationLog']);
    Route::get('operation/ajax',['as'=>'operationlog.ajax','uses'=>'LogController@ajaxOperationLog']);
    Route::get('logs/index',['as'=>'logs.index','uses'=>'LogController@logs']);
    Route::get('logs/ajax',['as'=>'logs.ajax','uses'=>'LogController@ajaxLogs']);

    //分类管理
    Route::resource('category', 'CategoryController');

    //课程管理
    Route::resource('course', 'CourseController');

    //单页管理
    Route::resource('page', 'PageController');

    //列表管理
    Route::resource('list', 'ListController');

    //教师列表
    Route::resource('teacher', 'TeacherController');

    //教师列表
    Route::resource('banner', 'BannerController');


    //上传图片
    Route::post('upload/uploadFile','UploadController@uploadFile')->name('upload.uploadfile');
    Route::post('upload/uploadImage','UploadController@uploadImage')->name("upload.uploadimage");
    Route::post('upload/deleteFile','UploadController@deleteFile')->name("upload.deletefile");

    //客户列表
    Route::resource('member', 'MemberController');



});


