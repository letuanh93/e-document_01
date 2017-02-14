class PermitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @guest = User.find_by id: params[:guest_id]
  end

  def create
    @permit = current_user.active_invite.build permit_params
    if @permit.save
      flash[:success] = "Shared success"
    end
  end

  private
  def permit_params
    params.require(:permit).permit :guest_id
  end
end
