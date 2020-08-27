class AddLocalGuideToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :local_guide, :boolean
  end
end
