class ApplicantFamilyDetail < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_family_detail

  validates :no_in_fam, :sisters, :brothers, :eldest, :youngest, :children, presence: true
  validates :applicant, presence: true
  validates :applicant_id, uniqueness: true

end
