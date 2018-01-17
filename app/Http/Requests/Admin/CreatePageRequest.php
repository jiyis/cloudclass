<?php
/**
 * Created by PhpStorm.
 * User: Gary.P.Dong
 * Date: 2016/6/17
 * Time: 8:30
 */

namespace App\Http\Requests\Admin;


class CreatePageRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required|string|max:100',
            'url' => 'required|string|unique:pages',
            'titlepic' => 'required|string',
            'content' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '单页名称必须',
            'name.max' => '单页名称最多100个字符',
            'titlepic.required' => '单页图片必填',
            'url.required' => '单页路由必填',
        ];
    }
}