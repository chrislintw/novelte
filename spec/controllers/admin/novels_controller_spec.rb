require 'rails_helper'

RSpec.describe Admin::NovelsController, type: :controller do
  before(:each) do
    user = create(:user)
    user.add_role(:admin)
  end

  describe '#index' do
    it 'response is success' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'response is success' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
  end

  describe '#show' do
    let(:novel) { create(:novel) }
    it 'response is success' do
      get :show, params: { id: novel.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:novel) { create(:novel) }
    it 'response is success' do
      get :edit, params: { id: novel.id }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
  end
end
