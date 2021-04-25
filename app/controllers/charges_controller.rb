class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  	@cat_id = params[:id]
  	@city_id = params[:city_id]
  end

  def create
    StripeChargesServices.new(charges_params, current_user).call
    redirect_to sub_categories_path(id: params[:cat_id], city_id: params[:city_id])
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
