require 'rails_helper'

describe ArticlesController do
	describe 'GET index' do
		it 'has a 200 status code' do
			get :index
			expect(response.status).to eq(200)
		end

		context 'when articles exist' do
			it 'exposes all articles' do
				a = Article.create!
				get :index
				expect(assigns(:articles)).to eq([a])
			end
		end

		context 'when articles is nil' do
			it 'exposes no articles' do
				get :index
				expect(assigns(:articles)).to eq([])
			end
		end
	end

	describe 'GET show'
end