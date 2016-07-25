class AddSecurePassword < ActiveRecord::Migration
  def change
    add_column(:users, :secure_password, :string)
  end
end
