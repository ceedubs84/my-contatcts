class RemoveContactIdFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :contact_id, :integer
  end
end
