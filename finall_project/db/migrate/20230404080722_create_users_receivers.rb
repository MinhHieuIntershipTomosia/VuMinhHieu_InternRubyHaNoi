class CreateUsersReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :users_receivers do |t|
      t.integer :thanksCard_id
      t.integer :users_id
      
      t.timestamps
    end
  end
end
