class Study < ActiveRecord::Base
  belongs_to :profile
  validates :study, presence: true
end
