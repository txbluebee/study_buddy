class Tip < ActiveRecord::Base
  belongs_to :language
  before_save(:upcase_name)
  private

  define_method(:upcase_name) do
    self.name=(name().capitalize())
  end
end
