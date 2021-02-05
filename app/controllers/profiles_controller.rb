class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :name, :store_name, :store_url, :text).merge(user_id: current_user.id)
  end
end
