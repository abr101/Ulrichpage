class PostAdsController < ApplicationController
  before_action :set_post_ad, only: %i[ show edit update destroy ]
  skip_before_action :authenticate, only: [:show, :published_adz]

  # GET /post_ads or /post_ads.json
  def index
    @post_ads = current_user.post_ads
  end

  # GET /post_ads/1 or /post_ads/1.json
  def show
  end

  def published_adz
    @category_id = params[:category_id]
    @sub_category_id = params[:cat_id]
    @post_ads =  PostAd.where(city_id: params[:city_id] , category_id: params[:category_id], sub_category_id: params[:cat_id], status: 1)
    @city = City.find_by(id: params[:city_id])
    @cities = Country.find_by(id: @city.country.id).cities
  end

  # GET /post_ads/new
  def new
    @category_id = params[:category_id]
    @sub_category_id = params[:cat_id]
    @city_id = params[:city_id]
    @post_ad = PostAd.new(user_id: current_user.id)
  end

  # GET /post_ads/1/edit
  def edit
  end

  # POST /post_ads or /post_ads.json
  def create
    @post_ad = PostAd.new(post_ad_params)

    respond_to do |format|
      if @post_ad.save
        format.html { redirect_to @post_ad, notice: "Post ad was successfully created." }
        format.json { render :show, status: :created, location: @post_ad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_ads/1 or /post_ads/1.json
  def update
    respond_to do |format|
      if @post_ad.update(post_ad_params)
        format.html { redirect_to @post_ad, notice: "Post ad was successfully updated." }
        format.json { render :show, status: :ok, location: @post_ad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_ads/1 or /post_ads/1.json
  def destroy
    @post_ad.destroy
    respond_to do |format|
      format.html { redirect_to post_ads_url, notice: "Post ad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_ad
      @post_ad = PostAd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_ad_params
      params.require(:post_ad).permit(:title, :description, :location, :phone, :keywords, :email, :category_id, :sub_category_id, :city_id, :get_response, :terms_privacy, :business, :personal, :price, :negotiable, :status, :user_id, {avatars: []})
    end
end
