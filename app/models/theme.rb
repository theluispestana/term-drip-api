class Theme < ApplicationRecord
  belongs_to :user
  has_one :terminal_colorscheme, dependent: :destroy
  has_one :prompt, dependent: :destroy

  validates :name, presence: true
end
