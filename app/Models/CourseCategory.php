<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class CourseCategory extends Pivot
{

    protected $table = 'category_has_class';

}
