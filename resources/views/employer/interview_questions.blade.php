@extends('layout.employer_main')

@section('title', 'Post interview Questions')

@section('content')

    <section class="top" style="margin-top: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3><strong>Post interview Questions for {{$job->title}}</strong></h3>
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div><br />
                    @endif
                    <form action="{{route('employer.post_questions',$job->id)}}" method="post">
                    {{csrf_field()}}
                        <table id="question_table" class="table table-responsive table-striped">
                            <thead>
                            <tr>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Points (1-10)</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="form-group {{$errors->has('question')?' has-error':''}}">
                                        <textarea name="question[]" class="form-control" required placeholder="Enter a question"></textarea>
                                        @if($errors->has('question[]'))
                                            <span class="help-block">
                                                @error('question')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                @enderror
                                            <strong>{{$errors->first('question[]')}}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <select name="answer[]" class="form-control">
                                            <option value="1">Yes</option>
                                            <option value="0">No</option>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group  {{$errors->has('points')?' has-error':''}}">
                                        <input type="number" name="points[]" class="form-control" min="1" max="10" required>
                                    </div>
                                </td>
                                <td>
                                    <Button type="button" onclick="delete_row(this);">
                                        <i class="glyphicon glyphicon-minus"></i> Remove
                                    </Button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-lg-2">
                                <Button type="button" class="btn btn-primary" onclick="add_row();">
                                    <i class="glyphicon glyphicon-plus"></i> Add Row
                                </Button>
                            </div>
                            <div class="col-lg-2 col-lg-offset-4">
                                <input type="submit" class="btn btn-warning" style="border-radius: 0;" value="POST QUESTIONS NOW">
                                <br><br>
                            </div>
                        </div>

                    </form>
                    <!-- form ends here -->
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