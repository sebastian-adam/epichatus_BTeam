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
    return nil if !(User.find_by email: email)
    user = User.find_by email: email

    password_hash = Password.new(user.password_secure)







    password_hash = Password.new()
  end






end
