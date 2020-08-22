class AddDefaultToStunningViewsFeatured < ActiveRecord::Migration[6.0]
  def change
    change_column :stunning_views, :featured, :boolean, default: false
  end
end
