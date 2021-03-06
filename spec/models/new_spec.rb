require 'rails_helper'

describe New do
	describe 'model relations' do
		it { should belong_to(:admin) }
		it { should validate_presence_of :title }
		it { should validate_presence_of :content }
		it { should ensure_length_of(:content).is_at_least(320) }
	end

	let!(:n1) { New.create(title: 'foo', content: 'bar'*160, created_at: Time.now - 2.days) }
	let!(:n2) { New.create(title: 'foo', content: 'bar'*160) }

	describe '#desc_by_date' do
		it 'returns all news in descending order by created_at' do
			expect(New.desc_by_date).to eq([n2, n1])
		end
	end

	describe 'default scope' do
		it 'orders all news desc by created_at' do
			expect(New.all).to eq([n2, n1])
		end
	end
end