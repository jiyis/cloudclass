<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClassTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->comment('课程名称');
            $table->integer('period')->nullable()->comment('课时数');
            $table->integer('minute')->nullable()->comment('课程时间');
            $table->string('titlepic')->nullable()->comment('课程图片');
            $table->text('description')->nullable()->comment('课程简介');
            $table->text('target')->nullable()->comment('课程目标');
            $table->text('syllabus')->nullable()->comment('课程大纲');
            $table->longText('content')->nullable()->comment('课程内容');
            $table->integer('teacher_id')->comment('主讲老师');
            $table->integer('click')->default(0)->comment('点击数');
            $table->timestamps();
            $table->softDeletes();

            $table->index(['name', 'period', 'minute', 'click', 'teacher_id', 'updated_at']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('class');
    }
}
