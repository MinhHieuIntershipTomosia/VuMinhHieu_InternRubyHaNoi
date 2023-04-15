class AddColumnDeleteStatusToUsersReceiver < ActiveRecord::Migration[7.0]
  def change
    add_column :users_receivers, :delete_status, :boolean, default: false
  end
end
