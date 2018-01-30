<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 18-1-15
 * Time: 上午11:29
 * Desc:
 */

namespace App\Http\Controllers\Api;


use App\Repository\MemberRepository;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserController extends Controller
{

    public $repository;

    public function __construct(MemberRepository $repository)
    {
        $this->repository = $repository;
    }

    public function update(Request $request)
    {
        if (JWTAuth::parser()->setRequest($request)->hasToken()) {
            try {
                $user = JWTAuth::parseToken()->authenticate();
                if(!empty($password = $request->input('password'))) {
                    $this->repository->update(['password' => $password], $user->id);
                }
                return response(['status' => 1]);
            } catch (TokenExpiredException $exception) {
                return response(['status' => 0]);
            }
        } else {
            return response(['status' => 0]);
        }

    }


}