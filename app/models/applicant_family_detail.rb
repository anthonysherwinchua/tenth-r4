class ApplicantFamilyDetail < ActiveRecord::Base

  belongs_to :applicant

  validates :no_in_fam, :applicant, presence: true
  validates :applicant_id, uniqueness: true

end
