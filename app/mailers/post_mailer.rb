class PostMailer < ApplicationMailer

	def new_post_email(email)
		#@image = "#{Rails.root}/app/assets/images/logo.png"
	    mail(to: email, subject: "Successfully posted ad!")
	end
end
