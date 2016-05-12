class ApplicantContactDetail < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_contact_details
  belongs_to :contact_type, inverse_of: :applicant_contact_details

  validates :value, presence: true
  validates :applicant, :contact_type, presence: true

end
