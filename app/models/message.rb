class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  field :conversation_id, type: Integer
  field :user_id, type: Integer
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  #embedded_in :conversation
  #embedded_in :user
  
end
