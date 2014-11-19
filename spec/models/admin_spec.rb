require 'rails_helper'

describe Admin do
	it { should have_many(:articles) }
	it { should have_many(:news) }
end