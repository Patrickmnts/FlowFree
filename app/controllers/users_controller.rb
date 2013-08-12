class UsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = Subscription.joins(:river).where("user_id = ?", params[:id])
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
