<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected $fillable = ['name','country','city','industry','website','about','image','user_id'];

    public function employer(){
        return $this->belongsTo(User::class);
    }
}
