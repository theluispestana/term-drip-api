class Theme < ApplicationRecord
  belongs_to :user
  has_many :terminal_colorschemes, dependent: :destroy
  has_many :prompts, dependent: :destroy
end
