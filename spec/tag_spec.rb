require('spec_helper')

describe(Tag) do
  describe("flashcards") do
    it("tag has many flashcards") do
      test_tag = Tag.create({:name => "Active Record"})
      test_flashcard1 = Flashcard.create({:question => "How are you", :answer => "Great", :tag_id => test_tag.id})
      test_flashcard2 = Flashcard.create({:question => "Do I need umbrella?", :answer => "No",:tag_id => test_tag.id})
    expect(test_tag.flashcards()).to(eq([test_flashcard1, test_flashcard2]))
    end
  end
  describe("#language") do
    it("tells tag belongs to language") do
      test_language = Language.create({:name => "Ruby"})
      test_tag = Tag.create({:name => "Active Record", :language_id => test_language.id})
      expect(test_tag.language()).to(eq(test_language))
    end
  end
end
