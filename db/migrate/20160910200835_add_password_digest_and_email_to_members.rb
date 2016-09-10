class AddPasswordDigestAndEmailToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :password_digest, :string
    add_column :members, :email, :string, unique: true
  end
end
