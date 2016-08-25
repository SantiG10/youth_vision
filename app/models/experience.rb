class Experience < ActiveRecord::Base
  belongs_to :profile
  validates :position, :description, :duration, :company, presence: true
end
