class Api::V1::ProfilesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def show
    @user = current_user
    authorize @user
        # skip_authorization
  end

  def update
    @user = current_user
    authorize @user
    # skip_authorization
    @user.update(profile_params)
    render :show
  end

  private

  def profile_params
    params.require(:user).permit(:nickname, :gender, :language, :avatar, :bio, :tag_list, :lat, :lng)
  end
end
