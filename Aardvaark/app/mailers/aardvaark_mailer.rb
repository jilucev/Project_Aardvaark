class AardvaarkMailer < ActionMailer::Base

  default from: "admin@hotintheoffice.com"

  def event_details
    mail :subject => "Mandrill rides the Rails!",
         :to      => "romanchukenator@gmail.com",
         :from    => "j.romanchuk@umblepie.com"
  end
end



  # def sign_up_notification(subscriber)

  #     @subscriber = subscriber

  #     mail(:to => @subscriber.email,
  #            :name => @subscriber.name,
  #            :subject => "Thanks for Signing Up",
  #            :unsub_link => unsub_email_link(@subscriber.email_token))   
  # end
