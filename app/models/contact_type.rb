class ContactType < ActiveRecord::Base

  has_many :applicant_contact_details, inverse_of: :contact_type

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
