require 'rails_helper'

describe PagesController do
	describe 'GET home' do
		it 'has a 200 status code' do
			get :home
			expect(response.status).to eq(200)
		end

		context 'when articles exist' do
			it 'exposes all articles' do
				a = Article.create!
				get :home
				expect(assigns(:articles)).to eq([a])
			end
		end

		context 'when articles is nil' do
			it 'exposes no articles' do
				get :home
				expect(assigns(:articles)).to eq([])
			end
		end
	end

	describe 'GET about' do
		it 'has a 200 status code' do
			get :about
			expect(response.status).to eq(200)
		end
	end
end