class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.find_each( p.comments.length > 10 ).compact
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @post = Post.new(params[:post])

    if @post.title.present? && @post.text.present? && @post.save
      flash[:notice] = "Post has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Post has not been created."
      render :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @login = @comment.user.login
    @commenter_address = @comment.commenter_address

    respond_to do |format|
      format.html
      format.xml
    end
  end

end

