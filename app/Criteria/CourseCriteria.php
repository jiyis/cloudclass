<?php

namespace App\Criteria;

use App\Models\CourseCategory;
use App\Repository\CategoryRepository;
use Illuminate\Http\Request;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

class CourseCriteria implements CriteriaInterface
{

    /**
     * @var \Illuminate\Http\Request
     */
    protected $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function apply($model, RepositoryInterface $repository)
    {
        if (empty($this->request->input('orderBy'))) {
            $model = $model->orderBy('updated_at', 'desc');
        };

        $categoryFilter = [
            'age'   => $this->request->input('age'),
            'stem'  => $this->request->input('stem'),
            'price' => $this->request->input('price'),
        ];
        if (collect($categoryFilter)->filter()->isNotEmpty()) {
            $filter = collect($categoryFilter)->filter(function ($item, $key) {
                return !empty($item);
            })->map(function ($item) {
                return CourseCategory::where(['category_id' => $item])->get()->pluck('class_id')->toArray();
            })->reduce(function ($carry, $item) {
                return $carry->isEmpty() ? collect($item) : $carry->intersect($item);
            }, collect())->toArray();

            $model = $model->whereIn('id', $filter);
        }

        return $model;
    }
}