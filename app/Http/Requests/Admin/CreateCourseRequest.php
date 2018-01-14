<?php
/**
 * Created by PhpStorm.
 * User: Gary.P.Dong
 * Date: 2016/6/17
 * Time: 8:30
 */

namespace App\Http\Requests\Admin;


class CreateCourseRequest extends Request
{
    public function rules()
    {
        return [];
        return [
            'name' => 'required|string|max:100',
            'period' => 'required|integer',
            'minute' => 'required|integer',
            'titlepic' => 'required|string',
            'description' => 'required|string',
            'target' => 'required|string',
            'syllabus' => 'required|string',
            'content' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '课程名称必须',
            'name.max' => '课程名称最多100个字符',
            'period.required' => '课时数必填',
            'minute.required' => '课程时间必填',
            'titlepic.required' => '课程图片必填',
            'description.required' => '课程简介必填',
            'target.required' => '课程目标必填',
            'syllabus.required' => '课程大纲必填',
            'content.required' => '课程内容必填',
        ];
    }
}