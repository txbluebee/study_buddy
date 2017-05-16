class User < ActiveRecord::Base

  has_many :languages
  validates :name, :presence => true
  validates :login, :uniqueness => true,
                    :length => {:minimum => 3, :maximum => 10}
  validates :password, :presence => true,
                       :length => {:minimum => 3, :maximum => 10}
end
