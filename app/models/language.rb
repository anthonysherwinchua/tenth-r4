class Language < ActiveRecord::Base

  has_many :applicant_languages, inverse_of: :applicant

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
