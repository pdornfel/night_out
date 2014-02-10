class EditComments < ActiveRecord::Migration
  def up
    drop_table :comments
  end

  def down
      create_table :comments do |t|
        t.text :body
        t.integer :user_id
        t.integer :event_id

      t.timestamps
    end

  end
end
