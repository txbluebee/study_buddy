class Language < ActiveRecord::Base
  belongs_to :user
  has_many :tips
  has_many :projects

end
