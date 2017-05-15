require('spec_helper')

describe(Tip) do
  describe("#name") do
    it("will return name of tip") do
      test_tip = Tip.create({:name => "create checkbox"})
      expect(test_tip.name).to(eq("create checkbox"))
    end
  end
  describe("#language") do
    it("will find which language is used on the tip") do
      test_language = Language.create({:name => "Ruby"})
      test_tip = Tip.create({:name => "create checkbox", :language_id => test_language.id()})
      expect(test_tip.language()).to(eq(test_language))
    end
  end
end
