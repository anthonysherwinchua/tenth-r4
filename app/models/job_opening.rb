class JobOpening < ActiveRecord::Base

  belongs_to :occupation
  belongs_to :country

  has_many :requirements, inverse_of: :job_opening

  validates :country, :occupation, presence: true
  validates :occupation_id, uniqueness: { scope: :country_id, message: 'combination of country and occupation already exists' }

end
