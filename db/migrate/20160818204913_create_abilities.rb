class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :ability
      t.integer :level
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
