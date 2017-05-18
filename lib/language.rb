class Language < ActiveRecord::Base
  belongs_to :user
  has_many :tips
  has_many :projects
  has_many :tags



  validates :name, :presence => true
  before_save(:upcase_name)

  private

  define_method(:upcase_name) do
    self.name=(name().capitalize())
  end
end
