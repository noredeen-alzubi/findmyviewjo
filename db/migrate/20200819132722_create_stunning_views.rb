class CreateStunningViews < ActiveRecord::Migration[6.0]
  def change
    create_table :stunning_views do |t|
      t.string :title
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :car_access
      t.boolean :free_access
      t.boolean :serviced
      t.boolean :family_friendly
      t.integer :overlooking
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
