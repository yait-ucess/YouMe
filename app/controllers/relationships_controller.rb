class RelationshipsController < ApplicationController
  before_action :find_profile, only: [:create, :destroy, :show]

  def create
    unless current_user == @profile.user
      @follow = current_user.relationships.create(followed_id: @profile.id)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @unfollow = current_user.relationships.find_by(followed_id: @profile.id)
    @unfollow.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @my_follow = @profile.user.relationships
    @follower = @profile.relationships
    binding.pry
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
