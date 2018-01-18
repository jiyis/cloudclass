<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Banner extends Model
{

    use SoftDeletes;

    protected $table = 'banner';

    protected $fillable
        = [
            'title',
            'titlepic',
            'description',
        ];
}
