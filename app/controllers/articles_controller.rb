class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user).order("created_at DESC")
  end

  def search
    @articles = SearchArticlesService.search(params[:keyword])
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @article.user.id
      @article.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private
  def article_params
    params.require(:article).permit(:image,:sentence).merge(user_id:current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @artilce.user.id
      redirect_to root_path
    end
  end
end


