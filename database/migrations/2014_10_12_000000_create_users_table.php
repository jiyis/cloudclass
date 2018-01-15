<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('nickname')->nullable();
            $table->string('email',100)->nullable();
            $table->string('password',100);
            $table->string('ip', 20)->nullable();
            $table->string('last_login_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('admin_users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique();
            $table->string('nickname');
            $table->string('email',100)->unique();
            $table->string('password',100);
            $table->string('ip', 20)->nullable();
            $table->string('last_login_at')->nullable();
            $table->tinyInteger('is_super')->default(0)->comment('是否超级管理员');
            $table->tinyInteger('status')->default(1)->comment('是否禁用');
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
