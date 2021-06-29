class DashboardController < ApplicationController
  skip_before_action :authenticate
  
  def show
  	@continents = Continent.all.includes(:countries)
    @category = Category.find_by(id: params[:id])
    
  end
  def conshow
    @category_id = params[:category_id]
    @sub_category_id = params[:sub_category]
    @continents = Continent.all.includes(:countries)  
  end
  
  def login_page
    @reply = params[:reply] if params[:reply].present?
    @giveaway = params[:giveaway] if params[:giveaway].present?
    @id = params[:id] if params[:id].present?
  end
  def store
  end
  def main
    
  end
  def search
  	@cities = City.where('name ILIKE ?', "%#{params[:search]}%")
  end
  def about_us
    @description = Dashboard.about_us.first.description
  end
  def contact_us
    @description = Dashboard.contact_us.first.description
  end
  def privacy
    @description = Dashboard.privacy.first.description
  end
  def terms
    @description = Dashboard.terms.first.description
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
