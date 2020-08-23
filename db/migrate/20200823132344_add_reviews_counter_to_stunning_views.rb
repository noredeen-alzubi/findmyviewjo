class AddReviewsCounterToStunningViews < ActiveRecord::Migration[6.0]
  def change
    add_column :stunning_views, :reviews_count, :integer, default: 0
  end
end
