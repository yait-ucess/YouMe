class ArticlesController < ApplicationController

  def index
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
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:image, :title, :text).merge(profile_id: @profile.id)
  end
end
