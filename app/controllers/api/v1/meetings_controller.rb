class Api::V1::MeetingsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_meeting, only: [:show, :update]

  # get /api/v1/meetings
  def index
    @meetings = policy_scope(Meeting)
    # skip_authorization
    authorize @meetings
  end

  def show
  end

  def update
    if @meeting.update(meeting_params)
      # skip_authorization
      render :show
    else
      render_error
    end
  end

  def new
  end

  def create
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:content, :status)
  end

  def render_error
    render json: { errors: @meeting.errors.full_messages },
      status: :unprocessable_entity
  end
end
