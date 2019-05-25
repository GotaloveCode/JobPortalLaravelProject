<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','seeker','employer','admin','image','phone'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'seeker' => 'boolean',
        'employer'  => 'boolean',
        'admin'  => 'boolean'
    ];


    public function isSeeker(){
        return $this->seeker;
    }
    public function isEmployer(){
        return $this->employer;
    }
    public function isAdmin(){
        return $this->admin;
    }
    // //User has one company
    public function company(){
        return $this->hasOne(Company::class);
    }
    //A User has many job
    public function many_job(){
        return $this->belongsToMany(Job::class)->withTimestamps();
    }

    //A Employer has many postings
    public function postings(){
        return $this->hasMany(Job::class);
    }
    //User has one location
    public function activity(){
        return $this->hasOne(Activity::class);
    }

    public function setPasswordAttribute($value){
        // only mutate if $value is not null
        $this->attributes['password'] = !!$value?bcrypt($value):null;
    }
}
