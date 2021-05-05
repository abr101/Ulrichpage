class ApplicationController < ActionController::Base 
 before_action :authenticate
 def authenticate
   if current_user.present?
   	  true
   else
   	if params[:reply].present?
   	  session[:previous_url] = request.fullpath
   	  redirect_to dashboard_login_page_path(reply: params[:reply], id: params[:id]), alert:"Access Denied! Please Sign In" and return
   	end
   	redirect_to main_app.dashboard_login_page_path, alert:"Access Denied! Please Sign In"
   end
 end

  def store_location
    if(request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr? && !current_user) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end


def current_user
  User.find_by(id: session["id"])
end

end