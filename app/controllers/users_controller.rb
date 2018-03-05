class UsersController < ApplicationController
  def new
  end

  def create
    User.create(username:user_params)
    redirect_to '/'
  end

  private

  def user_params
    params.permit(:username)
  end

end
