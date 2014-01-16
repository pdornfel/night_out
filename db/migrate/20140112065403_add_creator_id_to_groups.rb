class AddCreatorIdToGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :creator, :creator
  end
end
