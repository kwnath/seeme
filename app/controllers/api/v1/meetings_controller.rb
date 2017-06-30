class Api::V1::MeetingsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :update, :destroy]

  def index
    @meetings = policy_scope(Meeting)
    # authorize @meetings
  end

  def show
  end

  def update
    if @meeting.update(meeting_params)
      render :show
    else
      render_error
    end
  end

  def new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.sender = current_user
    authorize @meeting
    if @meeting.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @meeting.destroy
    render :index
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end

  def meeting_params
    params.require(:meeting).permit(:status)
  end

  def render_error
    render json: { errors: @meeting.errors.full_messages },
      status: :unprocessable_entity
  end
end
