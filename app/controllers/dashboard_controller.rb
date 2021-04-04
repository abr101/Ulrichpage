class DashboardController < ApplicationController
  skip_before_action :authenticate
  
  def show
  	@continents = Continent.all
  end
  def login_page
  end

  def search
  	@cities = City.where('name ILIKE ?', "%#{params[:search]}%")
  end

  def decide
  	@cat_id = params[:cat_id]
  	@city_id = params[:city_id]
  	@category_id = params[:category_id]
  end

  def signout
  	session[:id] = nil
  	redirect_to root_path
  end
end
