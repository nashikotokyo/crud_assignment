class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "投稿が作成されました"
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿が編集されました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿が削除されました"
  end


  private 
  #コールバック使って共通の処理はbefore_actionにまとめる
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
