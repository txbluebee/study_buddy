class User < ActiveRecord::Base
  has_many(:languages)
  validates :name, presence: true
  validates :name, uniqueness: true

end
