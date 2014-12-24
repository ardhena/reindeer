require 'rails_helper'

describe CommentsController do

  describe 'GET new' do
    let(:a) { create(:article) }
    it 'exposes object' do
      get :new, comment: { commentable_type: "Article", commentable_id: a.id }
      expect(controller.object).to eq(Article.find(a.id))
    end
    it 'creates new comment for object'
  end

  describe 'GET cancel' do
  end

  describe 'POST create' do
    let(:a) { create(:article) }
    it 'exposes object' do
      post :create, comment: { commentable_type: "Article", commentable_id: a.id }
      expect(controller.object).to eq(Article.find(a.id))
    end
    it 'creates new comment for object'
    it 'assigns user to comment'
    context 'when comment is saved'
      it 'saves comment'
    context 'when comment is not saved'
      it 'exposes new comment'
      it 'renders new action'
  end

end