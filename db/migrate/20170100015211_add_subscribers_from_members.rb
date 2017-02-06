class AddSubscribersFromMembers < ActiveRecord::Migration[5.0]
  def up
      Member.all.each do |member| 
          sub_id = Subscriber.create(email: member.email)
          Member.subscriber = sub_id
      end
  end
end
