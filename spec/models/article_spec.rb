require 'rails_helper'

describe Article do
	describe 'model relations' do
		it { should belong_to(:admin) }
	end

	describe '#desc_by_date' do
		it 'returns all articles in descending order by created_at' do
			n1 = Article.create!
			n2 = Article.create!
			n2.created_at = Time.now - 2.day
			n2.save!
			expect(Article.desc_by_date).to eq([n1, n2])
		end
	end
end