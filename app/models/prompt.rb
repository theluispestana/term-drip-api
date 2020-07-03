class Prompt < ApplicationRecord
  belongs_to :theme
  has_many :prompt_items, dependent: :destroy  
end
