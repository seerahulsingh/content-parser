class Content < ApplicationRecord
  belongs_to :page

  validates_presence_of :tag, :text, :page
end
