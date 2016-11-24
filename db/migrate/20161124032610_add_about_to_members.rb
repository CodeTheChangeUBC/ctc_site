class AddAboutToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :about, :text
  end
end
