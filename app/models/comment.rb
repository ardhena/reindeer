class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :comment, presence: true, length: { minimum: 10 }
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
  validates :user_id, presence: true

  default_scope -> { order('created_at desc') }

end
