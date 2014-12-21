require 'rails_helper'

describe PagesController do
	describe 'GET home' do
		it 'exposes 3 latest news' do
			n1 = create(:new)
			n2 = create(:new)
			n3 = create(:new)
			n4 = create(:new)
			get :home
			expect(controller.news).to eq([n4, n3, n2])
		end
		it 'exposes 1 latest article' do
			a1 = create(:article)
			a2 = create(:article)
			get :home
			expect(controller.articles).to eq([a2])
		end
		it 'renders home template' do
			get :home
			expect(response).to render_template(:home)
		end
	end

	describe 'GET about' do
		it 'renders about template' do
			get :about
			expect(response).to render_template(:about)
		end
	end
end