class TerminalColorscheme < ApplicationRecord
  belongs_to :theme
  has_many :colors, as: :colorable, dependent: :destroy  
end
