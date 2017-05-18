class Project < ActiveRecord::Base
  belongs_to :language
  
  validates :name, :presence => true
  before_save(:upcase_name)
  private

  define_method(:upcase_name) do
    self.name=(name().capitalize())
  end
end
