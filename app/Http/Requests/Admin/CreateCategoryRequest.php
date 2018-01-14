<?php
/**
 * Created by PhpStorm.
 * User: Gary.P.Dong
 * Date: 2016/6/17
 * Time: 8:30
 */

namespace App\Http\Requests\Admin;


class CreateCategoryRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required|max:100',
            'type' => 'required|integer',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '分类名称必须',
            'name.max' => '分类名称最多100个字符',
            'type.required' => '分类类别必填',
            'type.integer' => '分类类别必须为数字'
        ];
    }
}