class Language < ActiveRecord::Base
  has_many(:tags)
  belongs_to(:user)
  validates :name, presence: true
  validates :name, uniqueness: true

end
