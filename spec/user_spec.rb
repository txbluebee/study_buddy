require('spec_helper')

describe(User) do
  describe("#languages") do
    it("tests the user having many languages") do
      test_user = User.create({:name => "Bill Gates"})
      test_language1 = Language.create({:name => "Fortran", :user_id => test_user.id})
      test_language2 = Language.create({:name => "Pascal", :user_id => test_user.id})
    expect(test_user.languages()).to(eq([test_language1, test_language2]))
    end
  end
end
