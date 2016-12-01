require 'rails_helper'

RSpec.describe ChaptersController, type: :controller do
  before(:each) { @novel = create(:novel) }
  describe '#show' do
    let(:chapter) { create(:chapter, novel: @novel) }

    before(:each) do
      get :show, params: { novel_id: @novel.id, id: chapter.id }
    end

    it 'response is success' do
      expect(response).to(have_http_status(200))
    end

    it 'assigns a novel to @novel' do
      expect(assigns(:novel)).to eq @novel
    end

    it 'assigns a chapter to @chapter' do
      expect(assigns(:chapter)).to eq chapter
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

  end
  describe '#voting' do
  end
end
