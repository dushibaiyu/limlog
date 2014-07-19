class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :post_id
      t.string :author
      t.string :email
      t.string :url
      t.string :ip
      t.string :agent
      t.text :body

      t.timestamps
    end
  end
end
