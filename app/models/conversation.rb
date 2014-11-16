class Conversation
  include Mongoid::Document
  field :sender_id, type: Integer
  field :recipient_id, type: Integer
  
  # Added index 
  index({ sender_id: 1}, { unique: true })
  index({ recipient_id: 1}, {unique: true})
  
  # adding associations, sender and receiver of the conversation
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  
  has_many :messages, dependent: :destroy
  
  validates_uniqueness_of :sender_id, :scope => :recipient_id
  
  scope :involving, -> (user) do
    #where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
    any_of({:sender_id => user.id}, {:recipient_id => user.id})
  end
  
  scope :between, -> (sender_id,recipient_id) do
    any_of({ :sender_id => sender_id, :recipient_id => recipient_id}, {:recipient_id => sender_id, :sender_id => recipient_id})
  end
  
end
