class Language < ActiveRecord::Base
  belongs_to :user
  has_many :tips
  has_many :projects
  validates :name, :presence => true,
                   :uniqueness => true
end
