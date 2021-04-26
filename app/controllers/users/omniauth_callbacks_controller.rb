class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate
  def google_oauth2
    @path = session[:previous_url]
    admin = User.from_google(from_google_params)
    if admin.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      session[:id] = admin.id
      sign_in_and_redirect post_ads_path, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to dashboard_show_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    dashboard_show_path
  end

  def after_sign_in_path_for(resource)
    previous_path = @path
    session[:previous_url] = nil
    previous_path || post_ads_path
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end