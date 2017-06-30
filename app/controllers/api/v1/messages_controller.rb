class Api::V1::MessagesController < Api::V1::BaseController

   # before_action :set_recipient, only: [:new, :create]
     acts_as_token_authentication_handler_for User


   def index
      # @messages = current_user.messages
      # @messages = Message.find(params[:meeting_id])
      meeting = Meeting.find(params[:meeting_id])
      authorize(meeting)
      skip_policy_scope
      @messages = meeting.messages
   end

   def new
      # @message = current_user.sent_messages.new
   end

   def create
    # byebug
      @message = Message.create(message_params)
      @message.meeting = Meeting.find(params[:meeting_id])
      @message.save
      render json: @message
      # byebug
      # @
      # @message.recipient_id = @recipient.id
      skip_authorization
   end

   private

   def message_params
      params.require(:message).permit(:content, :recipient_id, :sender_id)
   end
end
