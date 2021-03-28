class DashboardController < ApplicationController
  skip_before_action :authenticate
  
  def show
  	@continents = Continent.all
  end
  def login_page
  end

  def signout
  	session[:id] = nil
  	redirect_to dashboard_show_path
  end
end
