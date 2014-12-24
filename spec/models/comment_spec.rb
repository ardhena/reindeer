require 'rails_helper'

describe Comment do
  it { should belong_to(:commentable) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_least(5) }
  it { should validate_presence_of(:comment) }
  it { should ensure_length_of(:comment).is_at_least(10) }
  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:user_id) }

  describe 'default scope' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:c1) { create(:comment, created_at: Time.now - 2.days) }
    let(:c2) { create(:comment) }
    it 'returns comments in order created_at desc' do
      expect(Comment.all).to eq([c2, c1])
    end
  end
end