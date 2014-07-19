class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :avatar
      t.text :desc
    end
  end
end
