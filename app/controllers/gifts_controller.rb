class GiftsController < ApplicationController
  before_action :find_profile, only: [:gift_params, :new, :create]
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
    if current_user.profile.present?
      @profile = current_user.profile
      @gift_receive = current_user.profile.gifts
      @gift_price = @gift_receive.map { |h| h[:price] }
      #binding.pry
    end
      @gift_give = current_user.gifts
  end

  private
  def gift_params
    params.require(:gift).permit(:price).merge(giver_id: current_user.id, receiver_id: @profile.id)
  end

  def find_profile
    #@profile = current_user.profile
    @profile = Profile.find(params[:profile_id])
  end

  def limit_gift
    if current_user == @profile.user
      redirect_to root_path
    end    
  end
end
