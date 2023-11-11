class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  # Create an index action taking the user id as a parameter
  def index
    @posts = @user.posts
    @comments = []

    @posts.each do |post|
      comments = post.comments.limit(5)
      @comments << comments
    end
  end

  # create a show action
  def show
    @post = Post.find(params[:id])
    @current_user = current_user
    @comments = @post.comments
    @comment = Comment.new(user: @current_user, post: @post)
  end

  def new
    @user = current_user
    @post = @user.posts.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
    puts 'created'
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.author_id = @user.id
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = ' Post created '
          redirect_to user_post_path(@user, @post)
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
