@extends('layout.employer_main')

@section('title', 'Interview Questions')

@section('content')

    <section class="top" style="margin-top: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3><strong>Interview Questions for {{$job->title}}</strong></h3>
                    <a href="{{route('employer.job',[$job->id])}}" class="btn btn-info"> <i class="glyphicon glyphicon-arrow-left"></i> Back to Jobs</a>
                    <table class="table table-responsive table-striped">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Points (1-10)</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($questions as $question)
                            <tr>
                                <td></td>
                                <td>{{$question->quest}}</td>
                                <td>{{$question->answer? "Yes" : "No"}}</td>
                                <td>{{$question->points}}</td>
                            </tr>
                            @empty
                                <tr>
                                    <td colspan="4">
                                        <span>No Questions created for this job yet. </span>
                                        <a href="{{route('employer.questions',[$job->id])}}">Create interview questions now.</a>
                                    </td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    <!-- form ends here -->
                    <h1></h1>
                </div>
            </div>
            <!-- row ends here -->
        </div>
        <!-- first container ends here -->
    </section>
@endsection
@section('script')
    <script type="text/javascript">
        function add_row()
        {
            $newrow = $("#question_table tbody tr:first").clone();
            $rowno=$("#question_table tbody tr").length;
            $rowno=$rowno+1;
            $("#question_table tr:last").after($newrow);
        }
        function delete_row(rowno)
        {
            $rowno = $("#question_table tbody tr").length;
            if($rowno>1){
                $(rowno).closest('tr').remove();
            }
        }
    </script>
@endsection