@extends('layout.seeker_main')

@section('title', 'Find Jobs')

@section('content')

    <section class="top" style="margin-top: 100px;">
        <div class="container">
        <form action="/seeker/keyword-wise-jobs" method="get">
        {{csrf_field()}}
            <div class="row">
                <div class="col-lg-6 col-lg-offset-4">
                    <input type="text" name="searchQuery" class="form-control" placeholder="Search Keywords" value="{{ old('searchQuery') }}">
                </div>
                <div class="col-lg-2">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-warning" value="Search">
                        </div>
                    </div>
                </div>
            </div><!-- row ends here=== -->
        </form>
            

            <div class="row top">
                <div class="col-lg-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Job Location</h3>
                        </div>
                        <div class="panel-body">
                            <form action="/seeker/location-wise-jobs" method="get">
                            {{csrf_field()}}
                                @foreach($countries as $country)
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="location[]" value="{{$country}}"> {{$country}}
                                    </label>
                                </div>
                                @endforeach
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="submit" class="btn btn-warning" value="Search" />
                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div>

                    <div class="panel panel-success top">
                        <div class="panel-heading">
                            <h3 class="panel-title">Category/Industry</h3>
                        </div>
                        <div class="panel-body">
                            <form action="/seeker/category-wise-jobs" method="get">
                            {{csrf_field()}}
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="IT/Software"> IT/Software
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Agricultural"> Agricultural
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Accounting/Finance"> Accounting/Finance
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Bank"> Bank
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Data Entry/Operator"> Data Entry/Operator
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Design/Creative"> Design/Creative
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Driving"> Driving
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Education/Training"> Education/Training
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Engineer/Architect"> Engineer/Architect
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Garments/Textile"> Garments/Textile
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="category[]" value="Multinational"> Multinational
                                    </label>
                                </div>
                                
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="submit" class="btn btn-warning" value="Search">
                                        </div>
                                    </div>
                            </form>
                            
                        </div>
                    </div>
              
            </div>
<!-- ---------Section for Jobs--------------------------- -->
                <div class="col-lg-6 ">
                @foreach($jobs as $job)
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">{{$job->title}}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4"><i class="fa fa-eye-slash"></i> {{$job->employer->company->name}}</div>
                                {{-- here the relationship is job belongs to one user->and user has one company --}}
                                <div class="col-lg-4"><i class="fa fa-location-arrow"></i> {{$job->city}}</div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="col-sm-offset-6 col-sm-10">
                                            <a href="/seeker/job/view/{{$job->id}}" target="_blank" class="btn btn-warning">VIEW</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    
                </div>
            </div>
            <!-- row ends here----------- -->

        </div>
        <!-- First container-fluid ends here -->
    </section>
@endsection
