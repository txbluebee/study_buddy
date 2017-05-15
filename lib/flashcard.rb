class Flashcard < ActiveRecord::Base
  belongs_to(:tag)
  validates :question, presence: true
  validates :answer, presence: true
end
