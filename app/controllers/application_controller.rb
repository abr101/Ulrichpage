class ApplicationController < ActionController::Base 
 before_action :authenticate
 before_action :set_locale
 around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

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

 

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end
end
