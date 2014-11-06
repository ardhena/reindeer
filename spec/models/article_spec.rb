require 'rails_helper'

describe Article do
	describe 'model relations' do
		it { should belong_to(:admin) }
	end

	let!(:a1) { Article.create(created_at: Time.now - 2.days) }
	let!(:a2) { Article.create }

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