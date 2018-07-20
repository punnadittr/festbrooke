class UsersController < ApplicationController
  include UsersHelper
  after_action :accept_mutual_friend, only: [:accept_friend]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end