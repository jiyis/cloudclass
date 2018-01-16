<?php
/**
 * Created by PhpStorm.
 * User: Gary.P.Dong
 * Date: 2016/6/17
 * Time: 8:30
 */

namespace App\Http\Requests\Admin;


class CreateListRequest extends Request
{
    public function rules()
    {
        return [
            'title' => 'required|string|max:100',
            'category' => 'required|integer',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '列表名称必须',
            'name.max' => '列表名称最多100个字符',
            'category.required' => '列表栏目必填',
        ];
    }
}