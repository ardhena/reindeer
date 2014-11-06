require 'rails_helper'

describe Article do
	describe 'model relations' do
		it { should belong_to(:admin) }
	end
end