class Application < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applications
  belongs_to :job_opening, inverse_of: :applications

  validates :applicant_code, presence: true
  validates :job_opening, presence: true
  validates :job_opening_id, uniqueness: { scope: :applicant_id, message: 'combination of applicant and job opening already exists'}

end
