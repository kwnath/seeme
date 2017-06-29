class Api::V1::MessagesController < Api::V1::BaseController
   acts_as_token_authentication_handler_for User
   # before_action :set_recipient, only: [:new, :create]

   def index
      # @messages = current_user.messages
      # @messages = Message.find(params[:meeting_id])
      meeting = Meeting.find(params[:meeting_id])
      authorize(meeting)
      skip_policy_scope
      @messages = meeting.messages
   end

   def new
      @message = current_user.sent_messages.new
   end

   def create
    Message.create(message_params)
   end

   private

   def message_params
      # params.require(:meeting_id)
      params.require(:meeting).permit(:message)
   end

   def set_recipient
       # @recipient = User.find(params[:user_id])
   end
end
