class FeedController < ApplicationController

	def index
		current_user
		@posts = Post.all
	end
end
