class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :profession
      t.string :last_company
      t.string :last_position
      t.string :country
      t.string :city
      t.text :responsibilities
      t.integer :type_job
      t.text :honors
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
