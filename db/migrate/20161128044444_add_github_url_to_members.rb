class AddGithubUrlToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :github_url, :string
  end
end
