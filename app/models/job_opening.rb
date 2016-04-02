class JobOpening < ActiveRecord::Base

  belongs_to :occupation
  belongs_to :country

  validates :country, :occupation, presence: true
  validates :occupation_id, uniqueness: { scope: :country_id, message: 'combination of country and occupation already exists' }

end
