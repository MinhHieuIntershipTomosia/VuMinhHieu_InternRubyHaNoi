class AddReferenceCommentsToThanksCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :thanks_cards, null: false, foreign_key: true
  end
end
