require('spec_helper')

describe(User) do
  describe("#name") do
    it("returns the user name") do
      test_user = User.create({:name => "Dan"})
      expect(test_user.name).to(eq("Dan"))
    end
  end
  describe('#languages') do
    it("returns the array of languages for the user ") do
      test_user = User.create({:name => "Dan"})
      langauge_1 = test_user.languages.create({:name => "Ruby"})
      langauge_2 = test_user.languages.create({:name => "Javascript"})
      expect(test_user.languages).to(eq([langauge_1, langauge_2]))
    end
  end
end
