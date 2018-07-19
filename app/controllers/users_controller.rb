class UsersController < ApplicationController
  include UsersHelper
  before_action :accept_mutual_friend, only: [:accept_friend]

  def accept_friend
    current_user.friends << adding_user
  end

  def accept_mutual_friend
    adding_user.friends << current_user
  end
end
