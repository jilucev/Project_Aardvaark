require 'mail'

class EventUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def self.confirmation_email(email, firstname, lastname, event, org, loc, event_time, type_of_event)
    Pony.mail({
      :subject => "You're a part of swell things, my good buddy, #{firstname}",
      :html_body => "Hey! #{firstname} #{lastname}, get your ass to #{loc}! Us at #{org} are expecting you at #{event_time}, sharp. Dress for a #{type_of_event}, be an adult.",
      :to => "#{email}",
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
  end

  def self.email_builder(event_user)
    firstname = User.find(event_user.user_id).firstname
    lastname = User.find(event_user.user_id).lastname
    email = User.find(event_user.user_id).email
    event = Event.find(event_user.event_id)
    org = Organization.find(event.organization_id).name
    loc = event.location
    event_time = event.event_time
    type_of_event = event.type_of_event


    EventUser.confirmation_email(email, firstname, lastname, event, org, loc, event_time, type_of_event)
  end

end
