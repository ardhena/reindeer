require 'rails_helper'

describe UserDecorator do
  describe '#name' do
    let(:user) { create(:user).decorate }
    it 'returns user full name' do
      expect(user.name).to eq('Joe MacMillan')
    end
  end
end