class AddMemberStatusTsToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :past_member, :boolean, default: false
  end
end
