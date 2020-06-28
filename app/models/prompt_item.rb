class PromptItem < ApplicationRecord
  belongs_to :prompt
  has_many :colors, as: :colorable, dependent: :destroy  
end
