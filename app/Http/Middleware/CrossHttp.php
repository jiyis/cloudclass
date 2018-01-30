<?php

namespace App\Http\Middleware;

use Closure;

class CrossHttp
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //axios 有时会发送两次请求
        /*if ($request->method() == 'OPTIONS') {
            return response()->json([]);
        }*/
        $response = $next($request);
        $response->header('Access-Control-Allow-Origin', '*');
        //$response->header('Access-Control-Allow-Origin', 'http://mytest.com');
        $response->header('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, Accept, Authorization');
        $response->header('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, OPTIONS');
        // $response->header('Access-Control-Allow-Credentials', 'true');+

        return $response;
    }
}
