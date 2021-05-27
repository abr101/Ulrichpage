class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  	@cat_id = params[:id] if params[:id].present?
  	@city_id = params[:city_id] if params[:city_id].present?
  end

  def specific
    @price = params[:price] if params[:price].present?
  end

  def create
    StripeChargesServices.new(charges_params, current_user).call
    if params[:cat_id].present? && params[:city_id].present?
      redirect_to sub_categories_path(id: params[:cat_id], city_id: params[:city_id])
    else
      redirect_to post_ads_path
    end
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
