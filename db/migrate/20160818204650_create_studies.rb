class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :study
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
