<?php

use App\Job;
use Carbon\Carbon;

function getUniqueLocations(){
    return Job::whereDate('deadline','>=',Carbon::today())->pluck('city')->unique();
}