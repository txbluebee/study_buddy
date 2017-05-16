class User < ActiveRecord::Base

  has_many :languages
  validates :name, :presence => true
  validates :login, :uniqueness => true
end
