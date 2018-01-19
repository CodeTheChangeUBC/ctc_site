class PostsController < ApplicationController
	before_action :admin, only: [:new, :create, :update, :destroy]
end
