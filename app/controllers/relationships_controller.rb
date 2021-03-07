class RelationshipsController < ApplicationController
  before_action :find_profile, only: [:create, :destroy]

  def create
    @follow = current_user.relationships.create(followed_id: @profile.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @unfollow = current_user.relationships.find_by(followed_id: @profile.id)
    binding.pry
    @unfollow.destroy
    redirect_back(fallback_location: root_path)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
