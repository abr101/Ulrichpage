class PostMailer < ApplicationMailer

	def new_post_email(email)
		@image= File.open("#{Rails.root}/app/assets/images/logo.png")
	    mail(to: email, subject: "Successfully posted ad!")
	end
end
