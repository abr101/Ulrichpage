class ApplicationController < ActionController::Base 
 before_action :authenticate

 def authenticate
   if current_user.present?
   	  true
   else
   	redirect_to dashboard_login_page_path, alert:"Access Denied! Please Sign In"
   end
 end

def current_user
  User.find_by(id: session["id"])
end
end
