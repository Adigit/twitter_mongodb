class UsersController < ApplicationController
  def index 
    @users = User.all
    @conversations = Conversation.involving(current_user).order("created_at DESC")
  end
end
