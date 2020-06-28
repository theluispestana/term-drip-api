class Theme < ApplicationRecord
  belongs_to :user
  has_many :colors, as: :colorable, :dependent: :destroy  
end
