class Country < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :enabled, -> { where(enabled: true) }

end
