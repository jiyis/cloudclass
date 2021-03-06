<?php

namespace App\Http\Requests\Admin;


class CreateAdminUserRequest extends Request
{

    public function rules()
    {
        return [
            'name' => 'required|max:20|alpha_dash',
            'nickname' => 'required|string|max:100',
            'email' => 'required|email|unique:admin_users',
            'password' => 'sometimes|max:20',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '用户名称不能为空',
            'name.alpha_dash' => '用户仅允许字母、数字、破折号（-）以及底线（_）',
            'name.max' => '用户名称最多20个字符',
            'nickname.required' => '用户昵称不能为空',
            'email.required' => '邮箱不能为空',
            'email.email' => '邮箱非法',
            'password.max' => '密码最多20个字符'
        ];
    }
}
