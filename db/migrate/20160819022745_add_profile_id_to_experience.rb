class AddProfileIdToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :profile_id, :integer
  end
end
