class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(article_id: params[:article_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = current_user.likes.find_by(article_id: @article.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
