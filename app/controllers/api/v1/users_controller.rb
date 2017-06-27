class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  acts_as_token_authentication_handler_for User, except: [ :show, :index, :create ]


  before_action :set_user, only: [ :show ]

  # GET /users
  def index
    @users = policy_scope(User)
    # authorize @user
  end

  # GET /users/:id

  def create
    code = params[:code]

    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV['APPID']}&secret=#{ENV['SECRET']}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient::Request.execute(
      method: :post,
      url: url
    )

    result = JSON.parse(response.body)
    email = result['openid'] + "@seeme.ninja"
    password = result['session_key'].to_s

    p result

      @current_user = User.where(email: email).first

    if @current_user
      @current_user.authentication_token = Devise.friendly_token
      @current_user.save!
    else
      @current_user = User.create(email: email, password: password, authentication_token: Devise.friendly_token)
    end
    skip_authorization
    render json: @current_user.authentication_token
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user  # For Pundit
  end

end


