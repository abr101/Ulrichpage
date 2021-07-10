class PostMailer < ApplicationMailer

	def new_post_email(email)
		attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.png")
	    mail(to: email, subject: "Successfully posted ad!")
	end
end
