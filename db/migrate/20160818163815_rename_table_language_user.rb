class RenameTableLanguageUser < ActiveRecord::Migration
  def change
     rename_table :language_users, :languages_users
  end
end
