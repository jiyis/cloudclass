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

Route::group(['namespace' => 'Api', 'as' => 'api.', 'middleware' => 'api'], function () {
    Route::get('courses', 'CourseController@index')->name('course.index');
    Route::get('banners', 'IndexController@banner')->name('index.banner');
    Route::get('lists/{url}', 'ListController@index')->name('list.index');
    Route::get('pages/{url}', 'PageController@index')->name('page.index');
});
