require('spec_helper')

describe(Flashcard) do
  describe("#tag") do
    it("tells which tag it belongs to") do
      test_tag = Tag.create({:name => "HTML"})
      test_flashcard = Flashcard.create({:question => "How are you", :answer => "Great", :tag_id => test_tag.id})
      expect(test_flashcard.tag()).to(eq(test_tag))
    end
  end
end
