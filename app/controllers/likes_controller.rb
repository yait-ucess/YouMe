class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(profile_id: params[:profile_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @like = current_user.likes.find_by(profile_id: @profile.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
