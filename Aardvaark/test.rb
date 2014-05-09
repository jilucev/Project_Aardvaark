require 'rubygems'
require 'mail'

mail = Mail.new do
  from    'jamesbook@umblepie.com'
  to      'romanchukenator@gmail.com'
  subject 'This is a test email'
  body    'Hope this all works!'
end

mail.to_s


Pony.mail(:to => 'romanchukenator@gmail.com', :from => 'j.romanchuk@umblepie.com', :subject => 'hi', :body => 'Hello there.')