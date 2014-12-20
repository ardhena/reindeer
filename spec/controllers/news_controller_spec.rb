require 'rails_helper'

describe NewsController do
	describe 'GET index' do
		it 'exposes all news' do
			new = create(:new)
			get :index
			expect(controller.news).to eq([new])
		end
		it 'paginates news' do
			n1 = create(:new)
			n2 = create(:new)
			n3 = create(:new)
			n4 = create(:new)
			n5 = create(:new)
			n6 = create(:new)
			get :index
			expect(controller.news.page(1).per(5)).to match_array([n6, n5, n4, n3, n2])
		end
		it 'renders index template' do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe 'GET show' do
		let(:new) { create(:new) }
		it 'exposes a news' do
			get :show, id: new
			expect(controller.new).to eq(new)
		end
		it 'renders show template' do
			get :show, id: new
			expect(response).to render_template(:show)
		end
	end
end