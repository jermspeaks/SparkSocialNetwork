module FeedHelper
	def current_user
		if session[:current_user]
			@current_user ||= User.find session[:current_user]
		else
			redirect_to root_path
		end
	end
end
