class UserInformation < ApplicationRecord
	belongs_to :user
	WHITELIST_PARAMS = [:name, :email, :address, :phone, :zipcode, :user_id]
	
end