class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tweet, type: String
  index({ starred: 1 })
end
