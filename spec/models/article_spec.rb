require 'rails_helper'

describe Article do
	describe 'model relations' do
		it { should belong_to(:admin) }
		it { should validate_presence_of :title }
		it { should validate_presence_of :content }
	end

	let!(:a1) { Article.create(title: 'foo', content: 'bar', created_at: Time.now - 2.days) }
	let!(:a2) { Article.create(title: 'foo', content: 'bar') }

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