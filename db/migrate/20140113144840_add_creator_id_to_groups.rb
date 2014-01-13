class AddCreatorIdToGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :creator, :string
    add_column :groups, :creator_id, :integer
  end

end
