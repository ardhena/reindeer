require 'rails_helper'

describe ProfilesController do

  let(:user) { create(:user) }
  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  describe 'GET my_profile' do
    it 'exposes current_user' do
      get :my_profile
      expect(controller.user).to eq(controller.current_user)
    end
    it 'renders template my_profile' do
      get :my_profile
      expect(response).to render_template(:my_profile)
    end
  end

  describe 'GET show' do
    it 'exposes user' do
      get :show, id: user.id
      expect(controller.user).to eq(user)
    end
    it 'renders template show' do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    it 'exposes current_user' do
      get :edit
      expect(controller.user).to eq(controller.current_user)
    end
    it 'renders template edit' do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH update' do
    it 'exposes current_user' do
      patch :update, user: attributes_for(:user)
      expect(controller.user).to eq(controller.current_user)
    end
    context 'profile info is valid' do
      it 'updates profile info' do
        patch :update, user: { first_name: 'John' }
        expect(controller.user.first_name).to_not eq('Joe')
      end
      it 'redirects to account details' do
        patch :update, user: attributes_for(:user)
        expect(response).to redirect_to my_profile_path
      end
      it 'gives successful notice' do
        patch :update, user: attributes_for(:user)
        expect(controller.flash[:notice]).to eq 'Your profile info was updated.'
      end
    end
    context 'profile info is not valid' do
      it 'renders edit template' do
        patch :update, user: { first_name: '', last_name: '', sex: '', birth: '', country: '', school: '', city: '' }
        expect(response).to render_template :edit
      end
    end
  end
end