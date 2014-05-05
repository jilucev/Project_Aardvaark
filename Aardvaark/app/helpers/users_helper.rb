module UsersHelper
    def user_message(current_user)
    add_to_message = ""
    message = "We still need your #{add_to_message}. Please complete your profile."
    case current_user
      when !current_user.firstname
        add_to_message += 'first name' 
      when !current_user.lastname
        add_to_message += 'last name'
      when !current_user.email
        add_to_message += 'email'
      when !current_user.phone
        add_to_message += 'phone number'
      when !current_user.gender
        add_to_message += 'gender'
      when !current_user.skills
        add_to_message += 'skills'
      when !current_user.age
        add_to_message += 'age'
      when !current_user.vehicle
        add_to_message += 'vehicle'
      when !current_user.passenger_capacity
        add_to_message += 'passenger capacity'
      else
        message = "Welcome back, #{current_user.firstname}"
        return message
      end
    return "Hi #{current_user.firstname}. #{message}"
  end

  # def relevant_events
  #   events_array = []
  #   @organizations = Organization.all
  #   @organizations.each do |organization| 
  #   events_array << organization.events.where(current_user[:id] == organization.events_users_tables.user_id)
  #   end
  #   events.flatten
  # end
end
