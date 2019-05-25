@extends('layout.seeker_main')

@section('title', 'Jobseeker Personal details')

@section('content')

    <section class="top" style="margin-top: 100px;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                    <h3 style="font-weight: 700; margin-left: 100px;">Welcome!</h3>
                    <p style="margin-left: 100px;"><strong>Complete your profile to apply</strong></p>
                    <form action="{{route('reg_stp_2')}}" method="post" class="form-horizontal">
                    {{csrf_field()}}
                        <div class="form-group{{$errors->has('phone')? ' has-error': ''}}">
                            <label for="phone" class="col-sm-4 control-label">Phone Number:*</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
                                 @if($errors->has('phone'))
                                    <span class="help-block">
                                        <strong>{{$errors->first('phone')}}</strong>
                                    </span>
                            @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-4 control-label">Current Location:*</label>
                            <div class="col-sm-8">
                                 <input name="location" type="text" class="form-control">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                               <p style="text-align: right;">* Mandatory field</p>
                                <button type="submit" class="btn btn-warning form-control" style="text-transform: uppercase;border-radius:0;">Proceed to Education</button><br><br><br>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </section>
@endsection