class AddProviderAndUidToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
  end
end
