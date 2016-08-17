class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.float :salary
      t.integer :type_offer
      t.string :url
      t.text :requirements
      t.string :location

      t.timestamps null: false
    end
  end
end
