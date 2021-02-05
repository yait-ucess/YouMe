class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private
  def configure_permitted_parameters
    #新規登録時のストロングパラメータに「nicknameカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def set_search
    @search = Article.ransack(params[:q])
    @search_articles = @search.result.includes(:profile).order("created_at DESC")
  end
end
