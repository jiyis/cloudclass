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

Route::prefix('auth')->group(function($router) {
    $router->post('login', 'AuthController@login');
    $router->post('logout', 'AuthController@logout');

});

Route::group(['namespace' => 'Api', 'as' => 'api.', 'middleware' => ['api', 'api.cross']], function () {
    Route::get('courses', 'CourseController@index')->name('course.index')->middleware(['refresh.token']);
    Route::get('banners', 'IndexController@banner')->name('index.banner');
    Route::get('lists/{url}', 'ListController@index')->name('list.index');
    Route::get('lists/{url}/{id}', 'ListController@show')->name('list.show');
    Route::get('pages/{url}', 'PageController@index')->name('page.index');
});
