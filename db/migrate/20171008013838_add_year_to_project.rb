class AddYearToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :year, :integer, default: Time.current.year
  end
end
