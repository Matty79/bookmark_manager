require 'bcrypt'

class User

include DataMapper::Resource

property :id, Serial
property :email, String, :required => true, :unique => true,
          format: :email_address
property :password_digest, Text

attr_reader :password
attr_accessor :password_confirmation

def password=(password) #writer method
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def self.authenticate(email, password)
  user = first(email: email)
  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
    nil
  end
end

validates_confirmation_of :password

end
