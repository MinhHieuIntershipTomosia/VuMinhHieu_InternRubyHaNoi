class AddUserReceiverDelete < ActiveRecord::Migration[7.0]
  def change
    add_column :users_receivers, :users_receivers_delete, :boolean, default: false
  end
end
