class Religion < ActiveRecord::Base

  has_many :applicants, inverse_of: :religion
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
