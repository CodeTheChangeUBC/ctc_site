class AddPositionAndUrlsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :position, :string, default: "Developer"
    add_column :members, :url1, :string
    add_column :members, :url2, :string
  end
end
