require('spec_helper')

describe(Project) do
  it("will capitalize first letter of user entry") do
    test_project = Project.create({:name => "study"})
    expect(test_project.name).to(eq("Study"))
  end
  describe("#name") do
    it("will return project by name") do
      test_project = Project.create({:name => "Study Buddy"})
      expect(test_project.name).to(eq("Study Buddy"))
    end
  end
  describe("#language") do
    it("will find which language is used on the project") do
      test_language = Language.create({:name => "Ruby"})
      test_project = Project.create({:name => "Study Buddy", :language_id => test_language.id()})
      expect(test_project.language()).to(eq(test_language))
    end
  end
end
