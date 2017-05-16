class Flashcard < ActiveRecord::Base
  belongs_to(:tag)
  validates :question, presence: true
  validates :answer, presence: true

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }

  def next
    tag.flashcards.next(self.id).first
  end

end
