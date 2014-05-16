require 'rubygems'
require 'mail'

mail = Mail.new do
  from    'jamesbook@umblepie.com'
  to      'romanchukenator@gmail.com'
  subject 'This is a test email'
  body    'Hope this all works!'
end

mail.to_s


Pony.mail(
  :to => 'romanchukenator@gmail.com', 
  :from => 'j.romanchuk@umblepie.com', 
  :subject => 'hi', 
  :body => 'Hello there.')


Pony.mail({
  :subject => "You're a part of good things, buddy",
  :html_body => "Guess who's emailing you from tux?",
  :to => "romanchukenator@gmail.com, j.romanchuk@umblepie.com",
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'romanchukenator@gmail.com',
    :password             => 'r0m@nchuk!',
    :authentication       => :plain, 
    :domain               => "localhost.localdomain" 
  }
})