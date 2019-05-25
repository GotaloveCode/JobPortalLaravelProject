<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPivotFieldToTableJobUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('job_user', function (Blueprint $table) {
            $table->integer('points')->default(0)->after('user_id');
            $table->integer('total')->default(0)->after('points');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('job_user', function (Blueprint $table) {
            $table->dropColumn('points');
            $table->dropColumn('total');
        });
    }
}
