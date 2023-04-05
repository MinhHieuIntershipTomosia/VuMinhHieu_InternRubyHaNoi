class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
    # add_index :comments, [:users_id, :thanksCard_id]
  end
end
