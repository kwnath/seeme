class Api::V1::UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    authorize @user
  end

  def show
  end
end
