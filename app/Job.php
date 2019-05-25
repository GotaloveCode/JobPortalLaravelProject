<?php

namespace App;

use App\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    protected $dates =['deadline','created_at'];

    protected $fillable = ['title','description','requirement','language','skill','user_id','industry','city','country','salary','deadline','career_level','degree','experience','posted','drafted'];

    //Job posted by employer
    public function employer(){
    	return $this->belongsTo(User::class,'user_id');
    }
    //A job has many applicants
    public function applicants(){
    	return $this->belongsToMany(User::class)->withPivot(['created_at','points','total']);
    }

    public function questions(){
        return $this->hasMany(Question::class);
    }


   
}
