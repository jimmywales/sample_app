module SessionsHelper

	def sign_in(user)
		user.save # testing by Jimmy to force setting remember_token in database
		cookies.permanent[:remember_token] = user.remember_token
		current_user = user
	end

	def signed_in?
		!current_user.nil?
	end


	def current_user=(user)
		@current_user = user
	end

	def current_user
		if cookies[:remember_token]==nil
			@current_user = nil;
		else
			@current_user  ||= User.find_by_remember_token(cookies[:remember_token])
		end
	end

	def sign_out
		cookies.delete(:remember_token)
		@current_user = nil
		user = nil
#		flash.now[:error] = "Signed out mofo"
	end


end
