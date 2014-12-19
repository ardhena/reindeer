class Article < ActiveRecord::Base
  belongs_to :admin

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 2000 }

  scope :desc_by_date, -> { order("created_at desc") }
  default_scope { desc_by_date }
end