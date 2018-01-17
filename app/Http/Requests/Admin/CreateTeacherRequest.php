<?php

namespace App\Http\Requests\Admin;


use Illuminate\Validation\Rule;

class CreateTeacherRequest extends Request
{

    public function rules()
    {
        return [
            'name'        => 'required|max:20',
            'titlepic'    => 'string|max:50',
            'description' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'name.required'        => '教师名称不能为空',
            'name.max'             => '教师名称最多20个字符',
            'titlepic.required'    => '教师头像不能为空',
            'description.required' => '教师简介不能为空',
        ];
    }


}
