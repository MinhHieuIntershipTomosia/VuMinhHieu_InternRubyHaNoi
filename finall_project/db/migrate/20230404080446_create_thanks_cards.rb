class CreateThanksCards < ActiveRecord::Migration[7.0]
  def change
    create_table :thanks_cards do |t|
      t.string :title
      t.string :content
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # add_index :thanks_cards, [:category_id, :users_id]
  end
end
