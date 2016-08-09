class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :startDate
      t.datetime :endDate
      t.integer :volCap
      t.integer :volNum
      t.string :githubPage

      t.timestamps null: false
    end
  end
end
