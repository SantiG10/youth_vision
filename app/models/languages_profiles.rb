class LanguagesProfiles < ActiveRecord::Base
  belongs_to :language
  belongs_to :profile
end
