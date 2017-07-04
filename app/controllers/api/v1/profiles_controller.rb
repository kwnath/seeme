class Api::V1::ProfilesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def show
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update(profile_params)
    render :show
  end


  def addhobby
    # byebug
    @user = current_user
    authorize @user
    @user.tag_list.add(params[:hobby])
    @user.save
    render :show
  end

  private

  def profile_params
    params.require(:user).permit(:nickname, :gender, :language, :avatar, :bio, :tag_list, :lat, :lng, :phone)
  end
end
