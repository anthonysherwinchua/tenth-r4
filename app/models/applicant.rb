class Applicant < ActiveRecord::Base

  belongs_to :religion, inverse_of: :applicants
  belongs_to :civil_status, inverse_of: :applicants

  has_one :applicant_family_detail, dependent: :destroy
  has_many :applicant_family_members, inverse_of: :applicant, dependent: :destroy

  validates :first_name, :last_name, :birthday, :gender, presence: true
  validates :religion, :civil_status, presence: true

end
