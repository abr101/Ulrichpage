class UserInformationsController < ApplicationController

	def index
		@userinfo = UserInformation.new
		
	end
	def new
		@userinfo = UserInformation.new
		
	end
	def page; end

	def create
		unless current_user.user_information.present?
		 if !verify_recaptcha
			@userinfo = UserInformation.new(user_information_params)
			if @userinfo.save!
				redirect_to page_user_informations_path, notice: "You have Successfully qualify to giveaway!"
			else
				redirect_to request.referer, notice: "You have already part of this Giveaway
			"
				
			end
		else
			redirect_to page_user_informations_path, notice: "You have already part of this Giveaway
			"
			
			end
		else
			redirect_to page_user_informations_path, notice: "You have already part of this Giveaway
			"
	    end
		
	end
	def user_information_params

		params.require(:user_information).permit (UserInformation::WHITELIST_PARAMS)
	end
end