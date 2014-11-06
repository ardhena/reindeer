require 'rails_helper'

describe PagesController do
	describe 'GET home' do
		it 'has a 200 status code' do
			get :home
			expect(response.status).to eq(200)
		end

		context 'when news exist' do
			it 'exposes all news' do
				n1 = New.create!
				n2 = New.create!
				n3 = New.create!
				n4 = New.create!
				get :home
				expect(assigns(:news)).to eq([n4, n3, n2])
			end
		end

		context 'when news is nil' do
			it 'exposes no news' do
				get :home
				expect(assigns(:news)).to eq([])
			end
		end

		context 'when articles exist' do
			it 'exposes all articles' do
				a1 = Article.create!
				a2 = Article.create!
				get :home
				expect(assigns(:articles)).to eq([a2])
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