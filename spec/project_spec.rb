require('spec_helper')

describe(Project) do
  describe("#name") do
    it("will return project by name") do
      test_project = Project.create({:name => "Study Buddy"})
      expect(test_project.name).to(eq("Study Buddy"))
    end
  end
end
