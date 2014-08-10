class FeedController < ApplicationController
	include ApplicationHelper
	def index
		current_user
		@posts = Post.all
	end
end
