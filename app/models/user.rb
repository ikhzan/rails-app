require 'bcrypt'

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email_address, type: String
  field :password_digest, type: String

  has_secure_password
  has_many :sessions, dependent: :destroy
end


# class User
#   include Mongoid::Document
#   include ActiveModel::SecurePassword

#   field :email_address, type: String
#   field :password_digest, type: String

#   has_secure_password
#   has_many :sessions, dependent: :destroy

#   def normalize_email
#     self.email_address = email_address.strip.downcase if email_address.present?
#   end

# end