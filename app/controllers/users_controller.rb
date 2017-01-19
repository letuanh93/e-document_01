class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource find_by: :slug

  def index
    @q = User.ransack params[:q]
    @users = @q.result(distinct: true).order("created_at DESC")
      .page(params[:page]).per Settings.users.per_page
    @friend_list = current_user.followings.order("created_at DESC")
      .page(params[:page]).per Settings.users.per_page
    @index = params[:page].nil? ? 0 :
      ((params[:page].to_i - 1) * (Settings.users.per_page))
  end

  def show
    @documents = @user.documents.order(created_at: :desc).page params[:page]
    @activities = PublicActivity::Activity.all.where(owner_id: @user.id)
      .order(created_at: :desc).page(params[:page]).per Settings.users.per_page
  end
end
