class CreateUsersReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :users_receivers do |t|
      t.references :thanks_cards, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true     
      t.timestamps
    end
  end
end
