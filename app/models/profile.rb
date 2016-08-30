class Profile < ActiveRecord::Base
  enum type_job: [:Practicas, :Trabajo]
  belongs_to :user
  has_many :experiences
  accepts_nested_attributes_for :experiences, allow_destroy: true
  has_many :studies
  accepts_nested_attributes_for :studies, allow_destroy: true
  has_many :skills
  accepts_nested_attributes_for :skills, allow_destroy: true
  has_and_belongs_to_many :languages
  validates :name, :email, :profession, :country, :state, :type_job, presence: true
  #validates :responsibilities, :honors, :last_company, :last_position, presence: true
end
