class ArticlesController < ApplicationController
  before_action :find_profile, onry: [:create]

  def index
    @articles = Article.includes(:profile).order("created_at DESC")
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

  private
  def article_params
    params.require(:article).permit(:image, :title, :text).merge(profile_id: @profile.id)
  end
  
  def find_profile
    @profile = current_user.profile
  end
end
