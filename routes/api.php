<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'auth', ], function($router) {
    $router->post('login', 'AuthController@login');
    $router->post('logout', 'AuthController@logout');
    $router->get('expire', 'AuthController@expire');
    $router->get('center', 'AuthController@center');

});

Route::group(['namespace' => 'Api', 'as' => 'api.', 'middleware' => ['api', 'api.cross']], function () {
    //->middleware(['refresh.token'])
    Route::get('courses', 'CourseController@index')->name('course.index')->middleware(['refresh.token']);
    Route::get('courses/search', 'CourseController@search')->name('course.search')->middleware(['refresh.token']);
    Route::get('courses/{id}', 'CourseController@show')->name('course.show')->middleware(['refresh.token']);
    Route::get('banners', 'IndexController@banner')->name('index.banner');
    Route::get('lists/{url}', 'ListController@index')->name('list.index');
    Route::get('lists/{url}/{id}', 'ListController@show')->name('list.show');
    Route::get('pages/{url}', 'PageController@index')->name('page.index');
    Route::get('category/{type}', 'CategoryController@index')->name('category.index');
    Route::patch('user', 'UserController@index')->name('user.update');
    Route::get('click/{id}', 'CourseController@click')->name('course.click');
});
