class Subscriber
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  belongs_to :product
  generates_token_for :unsubscribe
end
