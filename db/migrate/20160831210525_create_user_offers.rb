class CreateUserOffers < ActiveRecord::Migration
  def change
    create_table :user_offers do |t|
      t.integer :offer_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
