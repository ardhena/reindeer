require 'rails_helper'

describe NewDecorator do
  let(:admin) { create(:admin).decorate }
  let(:article) { create(:article, admin_id: admin.id, created_at: "2014-12-12 11:00:00").decorate }
  describe '#date' do
    it 'returns formatted date' do
      expect(article.date).to eq("2014-12-12 11:00:00")
    end
  end
  describe '#author' do
    it 'returns admin full name' do
      expect(article.author).to eq("Joe MacMillan")
    end
  end
end