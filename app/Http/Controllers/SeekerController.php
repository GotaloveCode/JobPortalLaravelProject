<?php

namespace App\Http\Controllers;

use App\Activity;
use App\Answer;
use App\Attachment;
use App\Company;
use App\Job;
use App\Link;
use App\Mail\CustomMail;
use App\Skill;
use App\User;
use App\Work;
use Carbon\Carbon;
use Illuminate\Filesystem\putFileAs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;

class SeekerController extends Controller
{
    public function personalInfo(Request $request){
    	$this->validate($request, [
    		'phone' => 'required|max:14',
    		]);
        auth()->user()->update(['phone'=>$request->phone]);

    	$personalInfo = new Activity;
    	//If this user id doesn't exist then create one row with this 'user_id' in Activity table
    	if(Activity::where('user_id', Auth::id())->get()->isEmpty()){
	    	$personalInfo->location = $request->location;
	    	$personalInfo->user_id = Auth::id();
	    	$personalInfo->save();
    	}else{
    		//else if this 'user_id' already  exist in this table then just update it.
    	 Activity::where('user_id', Auth::id())->update(['location'=>$request->location]);
    	}

    	return redirect()->route('seeker.edu');
    }

    public function education(Request $request){
    	Activity::where('user_id', Auth::id())->update(['college'=>$request->college, 'degree'=>$request->degree, 'field'=>$request->field, 'grade'=>$request->grade, 'country'=>$request->country, 'language'=>$request->language, 'interest'=>$request->interest]);

    	return redirect()->route('seeker.work');
    }
    //Shows Work and skill form 
    public function showWorkAndSkillForm(){
    	$works = Work::where('user_id', Auth::id())->get();
    	$skills = Skill::where('user_id', Auth::id())->get();

    	return view('jobseeker.seeker_register_stp4', compact('works','skills'));
    }
    //Posted Works data are stored here
    public function work(Request $request){
    	
    	$this->validate($request, [
    		'job_title'=>'required',
    		'company_name'=>'required'
    		]);
    	$newWork = new Work;
    	$newWork->job_title = $request->job_title;
    	$newWork->company_name = $request->company_name;
    	$newWork->country = $request->country;
    	$newWork->industry = $request->industry;
    	$newWork->job_role = $request->job_role;
    	$newWork->activity = $request->activity;
    	// $newWork->from = $request->from;
    	// $newWork->to = $request->to;
    	$newWork->user_id = Auth::id();
    	$newWork->save();

    	return $request->all();
    	
    }
    //Store Skills data
    public function skill(Request $request){
    	$newSkill = new Skill;
    	$newSkill->name = $request->name;
    	$newSkill->level = $request->level;
    	$newSkill->experience = $request->experience;
    	$newSkill->user_id = Auth::id();
    	$newSkill->save();

    	return $request->all();
    }
    //show edit cv form
    public function showEditCv(){
    	$works = Work::where('user_id', Auth::id())->get();
    	$skills = Skill::where('user_id', Auth::id())->get();
    	$user = auth()->user();
    	$activities = Activity::where('user_id', Auth::id())->get();
    	$links = Link::where('user_id', Auth::id())->get();
    	$attachments = Attachment::where('user_id', Auth::id())->get();

    	return view('jobseeker.seeker_edit_cv', compact('works','skills','user','activities','links','attachments'));
    }
    //store Edit_CV personal data
    public function storeEditCv(Request $request){
    	$user = auth()->user()->update(['name'=>$request->name,'phone'=>$request->phone]);
    	$activities = Activity::where('user_id', Auth::id())->update(['location'=>$request->location,'gender'=>$request->gender]);
    	
    	return $request->all();
    }
    //profile image upload
    public function profileImageUpload(Request $request){
    	$pro_image = $request->file('proimage');
    	if($request->hasFile('proimage')){
    		$pic = auth()->id().".".$pro_image->getClientOriginalExtension();
    		Storage::putFileAs('public/images', $pro_image, $pic);
            auth()->user()->update(['image' => $pic]);
    	}

    	return redirect()->route('seeker.edit_cv');
    }
    //store About me function data
    public function aboutMe(Request $request){
    	$about = $request->about_me;
    	Activity::where('user_id', Auth::id())->update(['about_me'=>$about]);
    	return $request->all();
    }
    //store Attachments data
    public function attachments(Request $request){
    	$doc = $request->file('document');
    	if($request->hasFile('document')){
    		$doc_orginal_name = $doc->getClientOriginalName();
    		Storage::putFileAs('public/attachments', $doc, $doc_orginal_name);
    	}
    	$newAttachment = new Attachment;
    	$newAttachment->name = $request->doc_name;
    	$newAttachment->document = $doc_orginal_name;
    	$newAttachment->user_id = Auth::id();
    	$newAttachment->save();

    	return redirect()->route('seeker.edit_cv');
    }
    //store Links data
    public function links(Request $request){
    	$newLink = new Link;
    	$newLink->name = $request->link_name;
    	$newLink->url = $request->url;
    	$newLink->user_id = Auth::id();
    	$newLink->save();

    	return $request->all();
    }
    //Show seeker Dashboard page
    public function showSeekerDashboard(){
    	$user = auth()->user();
    	return view('jobseeker.seeker_dashboard', compact('user'));
    }
    //show CV view page
    public function seekerCvView(){
    	$user = User::find(Auth::id());
    	$activity = Activity::where('user_id', Auth::id())->first();
    	$works = Work::where('user_id', Auth::id())->get();
    	$skills = Skill::where('user_id', Auth::id())->get();
    	$attachments = Attachment::where('user_id', Auth::id())->get();
    	$links = Link::where('user_id', Auth::id())->get();
    	return view('jobseeker.seeker_cv_view', compact('user','activity','works','skills','attachments','links'));
    }
    //show seeker home page
    public function index(){
    	return view('jobseeker.index');
    }
    //Seeker Job view page
    public function viewJob(Job $job){
        $user = auth()->user();
        $userjob = null;
        if($user){
            $userjob = $job->applicants()->where('user_id',$user->id)->first();
        }
        $applied = false;
        if($userjob){
            $applied = true;
        }
        $jobData = $job->load(['employer.company']);
        return view('jobseeker.seeker_job_view', compact('jobData','applied'));
    }
     //Shows the Find jobs page with available jobs
    public function showFindJobs(){
        $jobs = Job::where('posted', 1)->whereDate('deadline','>=',Carbon::today())
            ->with(['employer','employer.company'])->get();
        $countries = getUniqueLocations();
        return view('jobseeker.seeker_find_jobs', compact('jobs','countries'));
    }
    //show Apply to a Job Form
    public function showApplyJobForm(Job $job){
        $job = $job->load('questions');
        $user = auth()->user();
        return view('jobseeker.seeker_apply_now', compact('job','user'));
    }
    //successfully Applied to Job
    public function applyJob(Request $request,Job $job){
        $question_count = $job->questions()->count();
        $answers = $request->except('_token');
        if(sizeof($answers) != $question_count){
            $validator = \Validator::make([], []); // Empty data and rules fields
            $validator->errors()->add("answer",'Please fill all the questions');
            return redirect()->back()
                ->withErrors($validator->errors())
                ->withInput($request->all());
        }
        $question_ids = $job->questions()->pluck('questions.id')->toArray();
        if(sizeof(array_diff($question_ids,array_keys($answers))) > 0){
            $validator = \Validator::make([], []); // Empty data and rules fields
            $validator->errors()->add("answer",'Please fill all the questions');
            return redirect()->back()
                ->withErrors($validator->errors())
                ->withInput($request->all());
        }
        $questions = $job->questions()->get();
        $total = $questions->sum('points');
        $points = 0;

        DB::transaction(function () use ($answers,$questions,$points,$total,$job){
            foreach ($answers as $key => $value) {
                $points += $this->getScore($questions,$key,$value);
                Answer::create([
                    'question_id' => $key,
                    'user_id' => auth()->id(),
                    'value' => $value
                ]);
            }
            $job->applicants()->attach(auth()->id(),['points' => $points,'total' => $total]);
        });
//send mail to employer
        $user = auth()->user();
        $employer = $job->employer()->first();
        $subject = "New Job Applicant for {$job->title}";
        $body = "Dear {$employer->name},\n {$user->name} has applied for the job {$job->title} you posted";

        Mail::to($employer)->send(new CustomMail($subject, $body, []));

        $admins = User::where('admin',1)->get();

        $body = "Dear Admin,\n {$user->name} has applied for the job {$job->title} posted by {$employer->name}";
        Mail::to($admins)->send(new CustomMail($subject, $body, []));

        return redirect()->route('seeker.dashboard')->with('alerts', [
            ['type' => 'success', 'message' => "Job application successful"]
        ]);
    }

    function getScore($questions,$question_id,$answer_given){
        //get question
        $question = $questions->where('id',$question_id)->first();
        //get points on question if values match
        if($question->answer == $answer_given){
            return $question->points;
        }
        return 0;
    }
    //seeker delete an applied job from dashboard
    public function deleteJob($id){
        $user = auth()->user();
        $user->many_job()->detach(['job_id' => $id]);
         return redirect()->route('seeker.dashboard');
     } 
     //Show Category wise jobs
     public function showCategoryWiseJobs(Request $request){
        $jobs = Job::whereIn('industry', $request->category)
            ->with(['employer','employer.company'])->get();
         $countries = getUniqueLocations();
         return view('jobseeker.seeker_find_jobs', compact('jobs','countries'));
     }
     //show Location wise jobs
     public function showLocationWiseJobs(Request $request){
        $jobs = Job::whereIn('city', $request->location)->with(['employer','employer.company'])->get();
         $countries = getUniqueLocations();
         return view('jobseeker.seeker_find_jobs', compact('jobs','countries'));
     }

     //show jobs by Search Keywords
     public function showJobsBySearchKeywords(Request $request){
        $jobs = Job::whereDate('deadline','>=',Carbon::today())
            ->where('title', 'like', '%'.$request->searchQuery.'%')
            ->orwhere('industry','like'.'%'.$request->searchQuery.'%')
            ->orwhere('city','like'.'%'.$request->searchQuery.'%')
            ->with(['employer','employer.company'])
            ->get();
         $countries = getUniqueLocations();
         return view('jobseeker.seeker_find_jobs', compact('jobs','countries'));
     }
     //show seeker  Settings
     public function showUserSettings(){
        $user = auth()->user();
          return view('jobseeker.seeker_setting', compact('user'));
      } 
      //store seeker settings
      public function storeUserSettings(Request $request){
        $user = auth()->user();
        $old_password = bcrypt($request->old_password);
        echo $old_password;
        $new_password = $request->new_password;

        if($old_password === $user->password){
            $user->password = bcrypt($new_password);
        }
        // return redirect()->route('seeker.settings');
      }
      //download CV
      public function downloadCV($id){
        $file = Attachment::find($id);
        $pathToFile = 'storage/attachments/'.$file->document;
          return response()->download($pathToFile);
      }
      //contact me page
     public function contact(){
         return view('contact');
     }

}//controller ends here
