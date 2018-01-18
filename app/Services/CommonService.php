<?php
/**
 * Created by PhpStorm.
 * User: Gary.F.Dong
 * Date: 17-11-13
 * Time: 下午2:34
 * Desc:
 */

namespace App\Services;


use App\Models\Category;
use App\Models\CourseCategory;
use App\Models\Permission;
use App\Models\Role;
use App\Repository\CourseRepository;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;
use Auth;

class CommonService
{
    public static function getRoles()
    {
        $allRoles = Role::get(['name', 'display_name']);
        $arr      = [];
        foreach ($allRoles as $role) {
            $arr[$role['name']] = $role['display_name'];
        }
        return $arr;
    }

    public static function getTopPermissions()
    {
        $topPermissions = Permission::where('fid', 0)->orderBy('sort', 'asc')->orderBy('id', 'asc')->get();

        $arr = [];
        foreach ($topPermissions as $topPermission) {
            $arr[$topPermission->id] = $topPermission['display_name'] . '[' . $topPermission->name . ']';
        }
        $arr[0] = '--顶级权限--';
        return $arr;
    }

    /**
     * 感觉这样做并不是很好，目前还没有好的思路，先这样，后续有好的想法再来完善
     * @param bool $hidewx
     * @return array
     */
    public static function getMenus($hidewx = true)
    {
        //获取当前的路由控制器部分
        $current_route = Request::route()->getName();
        $curRoutes     = explode('.', $current_route);

        $curRoutes = $curRoutes[1];
        $fmenus    = Permission::where('fid', 0)->where('is_menu', 1)->orderBy('sort', 'asc')->orderBy('id', 'asc')->get();

        if (!empty($fmenus)) {
            foreach ($fmenus as $item) {
                $originName = $item->getOriginal()['name'];
                $item       = $item->toArray();
                if(stripos($item['name'],'/')) {
                    $explodeRoute        = explode('/', $item['name']);
                    $item['name'] = current($explodeRoute);
                    $item['params'] = end($explodeRoute);
                }
                if (($item['name'] !== '#' && $item['name'] !== '##') && !Route::has($item['name'])) {
                    continue;
                }

                if ($item['name'] == '##') $item['name'] = '#';
                $class = '';
                if ($item['name'] == Route::currentRouteName()) {
                    $class = 'active';
                }

                if (!Auth::guard('admin')->user()->is_super && !Auth::guard('admin')->user()->can($originName)) {
                    $class = 'hide';
                }
                $item['class'] = $class;
                if ($item['name'] == '#') {
                    $url = '#';
                } else {
                    if(isset($item['params'])) {
                        $url = route($item['name'], $item['params']);
                    } else {
                        $url = route($item['name']);
                    }
                }
                $item['href'] = ($item['name'] == '#') ? '#' : $url;

                if ($item['sub_permission']) {
                    foreach ($item['sub_permission'] as $key => $sub) {
                        if ($sub['is_menu']) {
                            /*if(stripos($sub['name'],'.*')){
                                $sub['name'] = str_replace('.*','.index',$sub['name']);
                            }*/
                            if(stripos($sub['name'],'/')) {
                                $value = explode('/', $sub['name']);
                                $sub['href']  = route($sub['name'], end($value));
                                $sub['name'] = current($value);
                            } else {
                                $sub['href']  = route($sub['name']);
                            }

                            $sub['icon']  = $sub['icon_html'] ? $sub['icon_html'] : '<i class="fa fa-circle-o"></i>';
                            $sub['class'] = '';
                            if (str_contains($sub['name'], $curRoutes)) {
                                $sub['class']  = 'active';
                                $item['class'] = $item['class'] . ' active';
                            }
                            if (!Auth::guard('admin')->user()->is_super && !Auth::guard('admin')->user()->can($sub['name'])) {
                                $sub['class'] = 'hide';
                            }
                            $item['sub'][] = $sub;
                        }
                    }
                    unset($item['sub_permission']);
                }
                $menus[] = $item;
            }
        }
        return $menus;
    }

    /**
     * 获取所有的分类
     */
    public static function getAllCategory()
    {
        $categories = app(Category::class)->all();

        return $categories->filter(function ($item) {
            return $item->name != '新闻资讯';
        })->groupBy('type')->map(function ($item) {
            return $item->pluck('name', 'id');
        })->toArray();
    }

    /**
     * 获取所有的付费课程
     * @return mixed
     */
    public static function getAllPayCourses()
    {
        //取出所有的付费课程id
        $ids = CourseCategory::where(['category_id' => 10])->get()->pluck('class_id')->toArray();
        $courses = app(CourseRepository::class)->findWhereIn('id', $ids);

        return $courses->pluck('name', 'id');
    }

    /**
     * 根据id获取栏目列表
     * @param $id
     * @return mixed
     */
    public static function getCategoryById($id)
    {
        //取出所有的付费课程id
        $categories = Category::where(['type' => $id])->get();

        return $categories->pluck('name', 'id');
    }


}