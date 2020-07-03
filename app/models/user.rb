class User < ApplicationRecord
  # has_many :prompts, dependent: :destroy  
  has_many :themes, dependent: :destroy  
end
