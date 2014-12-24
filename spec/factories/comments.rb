FactoryGirl.define do
  factory :comment do
    title 'My comment'
    comment 'I like trains'
    commentable_type 'Article'
    commentable_id '1'
    user_id '1'
  end
end