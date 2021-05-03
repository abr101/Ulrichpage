class PostMailer < ApplicationMailer

	def new_post_email(email)
	 mail(to: email, subject: "Successfully posted ad!")
	end
end
