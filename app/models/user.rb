require 'bcrypt'

class User

include DataMapper::Resource

property :id, Serial
property :email, String, :required => true, :unique => true,
format: :email_address
# messages: {
#   presence: "We need your email address",
#   is_unique: "We already have that email",
#   format: "Please enter a valid email address"
# }
property :password, BCryptHash

attr_reader :password
attr_accessor :password_confirmation

validates_confirmation_of :password

end
