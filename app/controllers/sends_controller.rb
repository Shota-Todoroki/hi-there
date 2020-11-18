class SendsController < ApplicationController
  before_action :set_send, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit]

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

  def show
    @comment = Comment.new
    @comments = @send.comments.includes(:user)
  end

  def edit
  end

  def update
    if @send.update(send_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @send.user.id
      @send.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private
  def send_params
    params.require(:send).permit(:image,:content).merge(user_id:current_user.id)
  end

  def set_send
    @send = Send.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @send.user.id
      redirect_to root_path
    end
  end
end


