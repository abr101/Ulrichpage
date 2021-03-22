class ApplicationController < ActionController::Base 
 before_action :authenticate

 def authenticate
   if current_user.present?
   else
   	redirect_to dashboard_show_path
   end
 end

def current_user
  User.find_by(id: session["id"])
end
end
