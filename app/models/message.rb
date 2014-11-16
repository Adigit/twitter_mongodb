class Message
  include Mongoid::Document
  field :body, type: String
  field :conversation_id, type: Integer
  field :user_id, type: Integer
  
  validates_presence_of :body, :conversation_id, :user_id
  #embedded_in :conversation
  #embedded_in :user
  
end
