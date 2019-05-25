
@if (count($errors) > 0)
<div class="alert alert-danger icon-alert clearfix m-3" role="alert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    @foreach ($errors->all() as $error)
        <p class="alert-text p-0 m-0">{{ $error }}</p>
    @endforeach
</div>
    </section>
@endif

@if(Session::has('alerts'))
    @foreach(Session::get('alerts') as $alert)
    <div class="alert alert-{{ $alert['type'] }} alert-dismissible m-3"  style="margin-top: 100px;" role="alert">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        {!! $alert['message'] !!}
    </div>
    @endforeach
@endif

@if(isset($alerts))
    <section class="container" style="margin-top: 60px;">
    @foreach($alerts as $alert)
        <div class="alert alert-{{ $alert['type'] }} alert-dismissible m-3" role="alert">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            {!! $alert['message'] !!}
        </div>
    @endforeach
    </section>
@endif

