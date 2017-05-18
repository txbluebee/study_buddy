class Tag< ActiveRecord::Base
  has_many(:flashcards)
  belongs_to(:language)
  validates :name, presence: true
  validates :name, uniqueness: true
  before_save(:upcase_name)
  private



  define_method(:upcase_name) do
    self.name=(name().capitalize())
  end
end
