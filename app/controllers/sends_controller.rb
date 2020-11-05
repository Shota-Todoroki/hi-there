class SendsController < ApplicationController
  def index
    @sends = Send.includes(:user).order("created_at DESC")
  end
end
