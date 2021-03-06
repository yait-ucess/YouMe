class RelationshipsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @follow = current_user.relationships.create(followed_id: @profile.id)

  end
end
