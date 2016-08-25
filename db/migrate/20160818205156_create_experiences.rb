class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :position
      t.text :description
      t.integer :duration
      t.string :company

      t.timestamps null: false
    end
  end
end
