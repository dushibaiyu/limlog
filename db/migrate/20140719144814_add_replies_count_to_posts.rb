class AddRepliesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :replies_count, :integer
  end
end
