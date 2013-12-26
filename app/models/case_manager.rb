class CaseManager < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  has_many :families

  def full_name
    [first_name, last_name].join(' ')
  end
end
