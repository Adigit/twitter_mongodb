class MessagesController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    @conversation = Conversation.find(params[:conversation_id])
    logger.error ">>>> @conversation >>>> #{@conversation.inspect}"
    
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    logger.error ">>>> @conversation.message >>>> #{@conversation.messages.inspect}"
    @path = conversation_path(@conversation)
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body)
  end
end