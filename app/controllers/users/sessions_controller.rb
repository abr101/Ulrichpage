class Users::SessionsController < Devise::SessionsController
  def after_sign_out_path_for(_resource_or_scope)
    dashboard_show_path
  end

  def after_sign_in_path_for(resource_or_scope)
    post_ads_path
  end
end