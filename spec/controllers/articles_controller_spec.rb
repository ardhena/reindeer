require 'rails_helper'

describe ArticlesController do
	describe 'GET index' do
		it 'exposes all articles' do
			article = create(:article)
			get :index
			expect(controller.articles).to eq([article])
		end
		it 'paginates articles' do
			a1 = create(:article)
			a2 = create(:article)
			a3 = create(:article)
			a4 = create(:article)
			get :index
			expect(controller.articles.page(1).per(3)).to match_array([a4, a3, a2])
		end
		it 'renders index template' do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe 'GET show' do
		let(:article) { create(:article) }
		it 'exposes an article' do
			get :show, id: article
			expect(controller.article).to eq(article)
		end
		it 'renders show template' do
			get :show, id: article
			expect(response).to render_template(:show)
		end
	end
end