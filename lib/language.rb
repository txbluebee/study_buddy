class Language < ActiveRecord::Base
  belongs_to :user
  has_many :tips
  has_many :projects
  has_many :tags

  # validates :name, presence: true
  # validates :name, uniqueness: true

  validates :name, :presence => true,
                   :uniqueness => true

end
