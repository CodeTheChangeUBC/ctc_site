class AddExecAndAdminBooleanToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :exec, :boolean,  default: false
    add_column :members, :admin, :boolean, default: false
  end
end
