class UserInformation < ApplicationRecord
	belongs_to :user
	WHITELIST_PARAMS = [:name, :email, :address, :phone, :user_id]
	
end