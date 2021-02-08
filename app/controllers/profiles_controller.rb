class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_profile, only: [:show, :edit, :update]

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

  def edit
    unless @profile.user == current_user
      redirect_to root_path
    end
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :name, :store_name, :store_url, :text).merge(user_id: current_user.id)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
