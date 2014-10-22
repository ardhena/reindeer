class New < ActiveRecord::Base
  belongs_to :admin

  scope :desc_by_date, -> { order("created_at desc") }
  default_scope { desc_by_date }
end
