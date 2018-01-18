<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('category', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->comment('名称');
            $table->string('type')->comment('分类类型：1、使用年龄 2、STEM侧重 3、价格类型');
            $table->string('url')->comment('分类的url，用于取唯一分类');
            $table->timestamps();
            $table->softDeletes();

            $table->index(['name', 'type', 'url']);
        });

        Schema::create('category_has_class', function (Blueprint $table) {
            $table->integer('category_id')->unsigned();
            $table->integer('class_id')->unsigned();

            $table->foreign('category_id')
                ->references('id')
                ->on('category')
                ->onDelete('cascade');

            $table->foreign('class_id')
                ->references('id')
                ->on('class')
                ->onDelete('cascade');

            $table->primary(['category_id', 'class_id']);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('category');
        Schema::dropIfExists('category_has_class');
    }
}
