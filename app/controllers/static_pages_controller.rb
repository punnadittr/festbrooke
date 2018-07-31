class StaticPagesController < ApplicationController
  def home
    redirect_to posts_path if current_user
  end
end
