class AddSubscriberColumnToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :subscriber, :integer
  end
end
