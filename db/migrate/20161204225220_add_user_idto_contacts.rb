class AddUserIdtoContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
  end
end
