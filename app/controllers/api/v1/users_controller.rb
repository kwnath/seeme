 class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  acts_as_token_authentication_handler_for User, except: [ :show, :index, :create ]



  before_action :set_user, only: [ :show ]


  # GET /users
  # def index
  #   @users = policy_scope(User)
  #   # authorize @user
  # end

  def index
    @users = policy_scope(User)
    lat = params['lat']
    lng = params['lng']
    @nearby = User.near([lat, lng], 3)


    render json: @nearby
  end

 def search
    @users = User.tagged_with(params[:tag], :any => true, :wild => true)
    authorize @users
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
    user['email'] = (result.fetch('openid', '')  + "@seeme.ninja"
    user['password'] = (result.fetch('session_key', '')

    # Conditions to find or create user.
    # Find user - regenerates a token.
    # Create user - creates a new user.

      @current_user = User.find_by_email(email)

    user['authentication_token'] = Devise.friendly_token

    unless @current_user
      @current_user = User.create(email: email,
                               password: password,
                               nickname: user['nickName'],
                                 gender: user['gender'],
                               language: user['language'],
                                 avatar: user['avatarUrl'],
                   authentication_token: Devise.friendly_token)
    end
    render json: @current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user  # For Pundit
  end
end


