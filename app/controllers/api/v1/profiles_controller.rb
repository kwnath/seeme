class Api::V1::ProfilesController < ApplicationController
  acts_as_token_authentication_handler_for User

  def edit
  end

  def show
  end

  def update
  end

  private

  def profile_params
    # params.require(:profile).permit(:)
  end

  def set_profile
    @profile = User.find(params[:id])
  end

end
