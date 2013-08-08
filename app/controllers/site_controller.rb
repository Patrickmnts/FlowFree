class SiteController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(params[:id])
    end
  end
end
