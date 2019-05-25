@extends('layout.seeker_main')
@section('title', 'Apply now')
@section('content')
<section class="top" style="margin-top: 100px;">
    <div class="container">
        <div class="row">
            <h3 class="text-center">APPLY FOR JOB</h3>
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-9">
                        <h4>Please fill the questionaire below as accurately as possible</h4>
                        <form method="post">
                            {{csrf_field()}}
                            @foreach($job->questions as $question)
                                <div class="form-group">
                                        <label for="{{$question->id}}[]" class="control-label">
                                            {{$loop->iteration}}. {{$question->quest}}
                                        </label>
                                    <label class="radio-inline"><input type="radio" value="1" name="{{$question->id}}" required>Yes</label>
                                    <label class="radio-inline"><input type="radio" value="0" name="{{$question->id}}">No</label>
                                </div>
                            @endforeach
                            <div class="form-group top">
                                <div class="col-sm-offset-5 col-sm-12">
{{--                                    href="/seeker/apply/successfull/{{$job->id}}"--}}
                                    <button type="submit" class="btn btn-lg btn-warning">SEND</button><br><br><br>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-3">
                        <h4>Job Info</h4>
                        <p><strong>Job Title: </strong>{{$job->title}}</p>
                        <p><strong>Company Name: </strong>{{$job->employer->company->name}}</p>
                        <hr>
                        <h4>Your contact information</h4>
                        <p><strong>Email: </strong>{{$user->email}}</p>
                        <p><strong>Phone: </strong>{{$user->phone}}</p>
                    </div>
{{--                    <div class="col-lg-3 text-center">--}}
{{--                        <a href="{{route('view_job',[$job->id])}}" class="btn btn-info">--}}
{{--                            <i class="glyphicon glyphicon-info-sign"></i> Job Details--}}
{{--                        </a>--}}
{{--                    </div>--}}
                </div>
            </div>
            </div><!-- row ends here -->
            
            </div><!-- First container ends here -->
        </section>
        @endsection