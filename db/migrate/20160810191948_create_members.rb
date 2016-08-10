class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstName
      t.string :lastName
      t.integer :studentNumber

      t.timestamps null: false
    end
  end
end
