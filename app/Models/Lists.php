<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Lists extends Model
{

    use SoftDeletes;

    protected $table = 'lists';

    protected $fillable = ['title', 'category', 'titlepic', 'description', 'content'];

    /**
     * 新闻所属分类
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function cate()
    {
        return $this->belongsTo(Category::class, 'category', 'id');
    }

}
