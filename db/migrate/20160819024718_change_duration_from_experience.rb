class ChangeDurationFromExperience < ActiveRecord::Migration
  def change
    change_column :experiences, :duration, :string
  end
end
