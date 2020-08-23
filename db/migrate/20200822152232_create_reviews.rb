class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.references :stunning_view, null: false, foreign_key: true

      t.timestamps
    end
  end
end
