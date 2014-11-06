require 'rails_helper'

describe NewsController do
	describe 'GET index' do
		it 'has a 200 status code' do
			get :index
			expect(response.status).to eq(200)
		end

		context 'when news exist' do
			it 'exposes all news' do
				n = New.create!
				get :index
				expect(assigns(:news)).to eq([n])
			end
		end

		context 'when news is nil' do
			it 'exposes no news' do
				get :index
				expect(assigns(:news)).to eq([])
			end
		end
	end

	describe 'GET show'
end