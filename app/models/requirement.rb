class Requirement < ActiveRecord::Base

  belongs_to :document
  belongs_to :job_opening

  validates :job_opening, :document, presence: true
  validates :document_id, uniqueness: { scope: :job_opening_id, message: 'combination of job opening and document already exists' }

end
