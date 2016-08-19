class RenameForumTopicToFromComments < ActiveRecord::Migration
  def change
    rename_column :comments, :forum_topic, :forum_id
  end
end
