class ApplicantFamilyMember < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_family_members
  belongs_to :relationship, inverse_of: :applicant_family_members

  validates :occupation, :name, :age, presence: true
  validates :applicant, :relationship, presence: true
  validates :relationship_id, uniqueness: { scope: :applicant_id, message: 'combination of applicant and relationship already exists'}

end
