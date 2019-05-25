<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class CustomMail extends Mailable
{
    use Queueable, SerializesModels;

    public $subject;
    public $body;
    public $attachments;

    /**
     * Create a new message instance.
     *
     * @param $subject
     * @param $body
     * @param array|null $attachments
     */
    public function __construct($subject, $body, array $attachments = null)
    {
        $this->body = $body;
        $this->attachments = $attachments ? : [];
        $this->subject = $subject;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $view =  $this->view('emails.blank');

        $view->subject($this->subject);
        $view->from('info@jobportal.com', 'Job Board');

        collect($this->attachments)->each(function($item) use (&$view){
            $view->attach(storage_path($item));
        });

        return $view;
    }
}
