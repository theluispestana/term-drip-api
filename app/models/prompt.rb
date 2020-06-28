class Prompt < ApplicationRecord
  belongs_to :user
  has_many :prompt_items, :dependent: :destroy  
end
