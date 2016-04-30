class Relationship < ActiveRecord::Base

  has_many :applicant_family_members, inverse_of: :relationship

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
