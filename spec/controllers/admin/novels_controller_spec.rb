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
    context 'with valid attributes' do
      it 'redirects to index'
      it 'add a novel'
    end
    context 'with invalid attributes' do
      it 'does not save the new novel'
      it 're-renders the new method'
    end
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
    context 'valid attributes' do
      it 'located the requested @novel'
      it 'redirects to the updated novel'
    end
    context 'invalid attributes' do
      it 'locates the requested @novel'
      it "does not change @novel's attributes"
      it 're-renders the edit method'
    end
  end
end
