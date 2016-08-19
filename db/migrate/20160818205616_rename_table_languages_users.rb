class RenameTableLanguagesUsers < ActiveRecord::Migration
  def change
    rename_table :languages_users, :languages_profiles
    rename_column :languages_profiles, :user_id, :profile_id
  end
end
