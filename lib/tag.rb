class Tag< ActiveRecord::Base
  has_many(:flashcards)
  belongs_to(:language)
  validates :name, presence: true
  validates :name, uniqueness: true
end
