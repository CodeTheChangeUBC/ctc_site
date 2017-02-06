class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.boolean :recieve_mail, default: true
      t.integer :no_email_date

      t.timestamps null: false
    end
  end
end
