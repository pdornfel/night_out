class AddCommentsToEvents < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end


end
