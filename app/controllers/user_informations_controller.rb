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
		 if verify_captcha?
			@userinfo = UserInformation.new(user_information_params)
			if @userinfo.save!
				redirect_to page_user_informations_path, notice: "You have Successfully qualify to giveaway"
			else
				redirect_to request.referer, notice: ""
				
			end
		else
			redirect_to page_user_informations_path, notice: "You have already part of this Giveaways
			"
			
			end
		else
			redirect_to request.referer
	    end
		
	end
	def user_information_params

		params.require(:user_information).permit (UserInformation::WHITELIST_PARAMS)
	end
end