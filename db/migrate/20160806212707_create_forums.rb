class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.text :title
      t.text :description
      t.integer :forum_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
