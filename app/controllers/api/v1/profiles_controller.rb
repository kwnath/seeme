class Api::V1::ProfilesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  after_action :verify_authorized, except: :index

  def show
    authorize current_user
    @user = current_user
  end

  def update
    # byebug
    authorize current_user

    @user = current_user
    @user.update(profile_params)
    render :show
  end

  def addhobby
    # byebug
    authorize current_user

    @user = current_user
    @user.tag_list.add(params[:hobby])
    @user.save
    render :show
  end

  private

  def profile_params
    params.require(:user).permit(:nickname, :gender, :language, :avatar, :bio, :tag_list, :latitude, :longitude, :phone)
  end
end
