<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $fillable =['job_id','quest','answer','points'];

    protected $casts =['answer'];

    public function job(){
        $this->belongsTo(Job::class);
    }
}
