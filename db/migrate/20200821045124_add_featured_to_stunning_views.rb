class AddFeaturedToStunningViews < ActiveRecord::Migration[6.0]
  def change
    add_column :stunning_views, :featured, :boolean
  end
end
