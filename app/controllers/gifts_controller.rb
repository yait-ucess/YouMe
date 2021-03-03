class GiftsController < ApplicationController
  before_action :find_profile, only: [:gift_params, :new, :create, :show]
  before_action :limit_gift, only: [:new, :create]

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    if @gift.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @gift = current_user.profile.gifts
    @gift_price = @gift.map { |h| h[:price] }
  end

  private
  def gift_params
    params.require(:gift).permit(:price).merge(giver_id: current_user.id, receiver_id: @profile.id)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def limit_gift
    if current_user == @profile.user
      redirect_to root_path
    end    
  end
end
