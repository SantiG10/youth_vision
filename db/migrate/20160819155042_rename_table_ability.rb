class RenameTableAbility < ActiveRecord::Migration
  def change
    rename_table :abilities, :skills
    rename_column :skills, :ability, :skill
  end
end
