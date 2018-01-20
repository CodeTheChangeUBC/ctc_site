class PostsController < ApplicationController
	before_action :admin, only: [:new, :create, :update, :destroy]

	def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if  @post.save
            redirect_to posts_url
            flash[:success] = "Post successfully created!"
        else
            render :new
        end
    end

    def index
    	@posts = Post.all.order(:created_at).reverse_order
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update 
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:success] = "Post Updated!"
        redirect_to posts_url
      else
        render 'edit'
      end
    end


    def destroy
        Post.find(params[:id]).destroy
        flash[:success] = "Post deleted"
        redirect_back_or posts_url
    end

    private
        def post_params
            params.require(:post).permit(:title, :text)
        end

end
