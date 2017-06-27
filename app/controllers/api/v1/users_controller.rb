class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users = policy_scope(User)
  end

  def show
  end
end
