class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    #@search_articles = Article.includes(:profile).order("created_at DESC")
    @articles = Article.includes(:profile).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @profile = current_user.profile
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @article.profile.user == current_user
      redirect_to root_path 
    end
  end

  def update
    @profile = current_user.profile
    @article.update(article_params)
    if @article.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @article.profile.user == current_user
      @article.destroy
      redirect_to root_path
    else
      render :root_path
    end
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:image, :title, :text).merge(profile_id: @profile.id)
  end
end
