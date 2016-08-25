class RenameCityFromProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :city, :state
  end
end
