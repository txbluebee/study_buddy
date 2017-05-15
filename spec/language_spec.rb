require('spec_helper')

describe(Language) do
  describe("#name") do
    it("returns the name of the language") do
      test_language = Language.create({:name => "Ruby"})
      expect(test_language.name).to(eq("Ruby"))
    end
  end
  describe("#user") do
    it("finds the user of the language") do
      test_user = User.create({:name => "Dan"})
      language_1 = Language.create({:name => "Ruby", :user_id => test_user.id()})
      expect(language_1.user()).to(eq(test_user))
    end
  end
end
