require 'rails_helper'

describe Article do
	describe 'model relations' do
		it { should belong_to(:admin) }
		it { should validate_presence_of :title }
		it { should validate_presence_of :content }
		it { should ensure_length_of(:content).is_at_least(2000) }
	end

	let!(:a1) { Article.create(title: 'foo', content: 'bar'*1000, created_at: Time.now - 2.days) }
	let!(:a2) { Article.create(title: 'foo', content: 'bar'*1000) }

	describe '#desc_by_date' do
		it 'returns all articles in descending order by created_at' do
			expect(Article.desc_by_date).to eq([a2, a1])
		end
	end

	describe 'default scope' do
		it 'orders all articles desc by created_at' do
			expect(Article.all).to eq([a2, a1])
		end
	end
end