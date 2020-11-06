class SendsController < ApplicationController
  def index
    @sends = Send.includes(:user).order("created_at DESC")
  end
  
  def new
    @send = Send.new
  end

  def create
    @send = Send.new(send_params)
    if @send.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def send_params
    params.require(:send).permit(:image,:content).merge(user_id:current_user.id)
  end

end


