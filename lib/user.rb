require 'bcrypt'

class User < ActiveRecord::Base
  validates(:username, :presence => true)
  validates(:email, :presence => true)
  validates(:password, :presence => true)
  include BCrypt
  has_many(:conversations, :foreign_key => :sender_id)

  def self.authenticate(params = {})
    email = params[:email]
    password = params[:password]
    found_user = nil
    if !(User.find_by email: email)
      found_user
    else
      user = User.find_by email: email
      password_hash = Password.new(user.secure_password)
      if password_hash == password
        found_user = user
      end
      found_user
    end
  end






end
