class Page < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :url, presence: true, uniqueness: true
  validates_format_of :url, :with => URL_REGEX
end
