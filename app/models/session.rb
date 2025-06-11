# class Session < ApplicationRecord
#   belongs_to :user
# end

class Session
  include Mongoid::Document
  field :user_agent, type: String
  field :ip_address, type: String

  belongs_to :user
end