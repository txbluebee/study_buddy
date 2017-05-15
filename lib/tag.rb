class Tag< ActiveRecord::Base
  has_many(:flashcards)
  validates :name, presence: true
  validates :name, uniqueness: true
end
