class AddColumnRememberTokenUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_token_user, :string
  end
end
