class CreateNags < ActiveRecord::Migration
  def change
    create_table :nags do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :group_id, null: false

      t.timestamps
    end
  end
end
