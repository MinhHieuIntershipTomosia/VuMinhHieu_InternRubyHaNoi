class AddCloumnDeleteStatusToThankscard < ActiveRecord::Migration[7.0]
  def change
    add_column :thanks_cards, :delete_status, :boolean , default: false
  end
end
