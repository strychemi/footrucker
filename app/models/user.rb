class User < ActiveRecord::Base
  has_many :favorites
  has_many :trucks, through: :favorites
end
