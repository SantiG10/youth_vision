class Skill < ActiveRecord::Base
  belongs_to :profile
  enum level: [:Basico, :Medio, :Avanzado]
  validates :skill, :level, presence: true
end
