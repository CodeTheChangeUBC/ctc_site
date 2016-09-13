class AddRememberDigestToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :remember_digest, :string
  end
end
