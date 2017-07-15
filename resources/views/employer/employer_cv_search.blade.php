@extends('layout.employer_main')

@section('title', 'Search CV database')

@section('content')

    <section class="top" style="margin-top: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-4">
                    <input type="text" class="form-control" placeholder="Search Keywords">
                </div>
                <div class="col-lg-2">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning">Search</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row ends here=== -->

            <div class="row top">
                <div class="col-lg-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Location</h3>
                        </div>
                        <div class="panel-body">
                            <form action="">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Dhaka
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Rajshahi
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Chittagong
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Sylhet
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Barisal
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Dinajpur
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Rangpur
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Mymensingh
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Khulna
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Comilla
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-warning">Search</button>
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
                            <form action="">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> IT/Software
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Agricultural
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Chittagong
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Sylhet
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Barisal
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Dinajpur
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Rangpur
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Mymensingh
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Khulna
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Comilla
                                    </label>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-warning">Search</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
                <!-- ---------Section for Jobs--------------------------- -->
                <div class="col-lg-6 ">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Name</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4"><i class="fa fa-eye-slash"></i> Print Last job title</div>
                                <div class="col-lg-4"><i class="fa fa-location-arrow"></i> Print Location</div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="col-sm-offset-6 col-sm-10">
                                            <button type="submit" class="btn btn-warning">VIEW</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- row ends here----------- -->

        </div>
        <!-- First container-fluid ends here -->
    </section>
@endsection
