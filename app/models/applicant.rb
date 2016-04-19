class Applicant < ActiveRecord::Base

  belongs_to :religion, inverse_of: :applicants
  belongs_to :civil_status, inverse_of: :applicants

  validates :first_name, :last_name, :birthday, :gender, presence: true
  validates :religion, :civil_status, presence: true

end
