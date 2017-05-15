class User < ActiveRecord::Base

  # has_many(:languages)
  # validates :name, presence: true
  # validates :name, uniqueness: true


  has_many :languages
  validates :name, :presence => true,
                   :uniqueness => true
end
