<?php


Route::bind('job', function ($value) {
    try {
        return App\Job::findOrFail($value);
    } catch (Illuminate\Database\Eloquent\ModelNotFoundException $e) {
        abort(404, "Job not found");
    }
});