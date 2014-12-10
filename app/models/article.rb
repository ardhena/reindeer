class Article < ActiveRecord::Base
  belongs_to :admin
  has_many :articles_comments

  validates :title, presence: true
  validates :content, presence: true

  scope :desc_by_date, -> { order("created_at desc") }
  default_scope { desc_by_date }
end