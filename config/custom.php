<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 17-11-14
 * Time: 上午10:25
 * Desc:
 */

return [

    "guards"   => [
        "admin" => "后台",
        "front" => "前台",
    ],

    /**
     * 课程分类
     */
    "category" => [
        1 => [
            'label' => "适用年龄",
            'value' => 'age',
            'type'  => 'multi',
        ],
        2 => [
            'label' => "STEM侧重",
            'value' => 'stem',
            'type'  => 'multi',
        ],
        3 => [
            'label' => "价格类型",
            'value' => 'price',
            'type'  => 'single',
        ],
        4 => [
            'label' => "新闻类型",
            'value' => 'news',
            'type'  => 'multi',
        ],
    ],

    /**
     * 上传图片或者文件保存的目录
     */
    'images'   => 'uploads/images/',
    'files'    => 'uploads/files/',

];