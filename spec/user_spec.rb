require('spec_helper')

describe(User) do
  it("validates presence of name") do
    test_user = User.new({:name => ""})
    expect(test_user.save()).to(eq(false))
  end

  it('validates the uniqueness of the name') do
    test_user1 = User.new({:name => "Dan"})
    test_user1.save()
    test_user2 = User.new({:name => "Dan"})
    expect(test_user2.save()).to(eq(false))
  end

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
