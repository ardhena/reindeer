class New < ActiveRecord::Base
  belongs_to :admin

  validates :title, presence: true
  validates :content, presence: true

  scope :desc_by_date, -> { order("created_at desc") }
  default_scope { desc_by_date }
end
