class UserMailer < ApplicationMailer

	#call back to set smtp config
	after_filter :set_smtp

	def registration_confirmation(user)
		mail(:to => user.email, :subject => 'Registered')		
	end

	private 

	# set smtp setting
	def set_smtp
		custom_smtp = {
			address: SMTP_SETTING['user']['address'],
			port: SMTP_SETTING['user']['port'],
			domain: SMTP_SETTING['user']['domain'],
			user_name: SMTP_SETTING['user']['user_name'],
			password: SMTP_SETTING['user']['password']
		}
		mail.delivery_method.settings.merge!(custom_smtp)
	end
end
