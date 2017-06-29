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
    # Send code, APPID and SECRET to weixin for openid and session_key
    code = params[:code]

    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV['APPID']}&secret=#{ENV['SECRET']}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient::Request.execute(
      method: :post,
      url: url
    )

    user = params[:userInfo]

    # GET both openid and session_key

    result = JSON.parse(response.body)
    email = result['openid'] + "@seeme.ninja"
    password = result['session_key'].to_s

    # Conditions to find or create user.
    # Find user - regenerates a token.
    # Create user - creates a new user.

      @current_user = User.where(email: email).first

    if @current_user
      # @current_user.authentication_token = Devise.friendly_token
      # @current_user.save!
    else
      @current_user = User.create(email: email,
                               password: password,
                               nickname: user['nickName'],
                                 gender: user['gender'],
                               language: user['language'],
                                 avatar: user['avatarUrl'],
                   authentication_token: Devise.friendly_token)
      # If the devise token is equal to something in the database, regenerate a new one
      while @current_user.authentication_token == User.where(authentication_token: @current_user.authentication_token).authentication_token
        @current_user.update(authentication_token: Devise.friendly_token)
      end
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


