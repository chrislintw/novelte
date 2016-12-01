require 'rails_helper'

RSpec.describe NovelsController, type: :controller do
  describe '#index' do
    def do_request
      get :index
    end

    it 'response is success' do
      do_request
      expect(response).to have_http_status(200)
    end

    it 'assigns a list of contributing novels to @contributing_novels' do
      # votting_novels
      do_request
      novels = create_list(:novel, 3)
      expect(assigns(:contributing_novels)).to eq novels
    end

    it 'assigns a list of votting_novels to @votting_novels' do
      do_request
      novels = []
      3.times do
        novels << create(:novel, status: 1)
      end
      expect(assigns(:votting_novels)).to eq novels
    end

    it 'renders the :index template' do
      do_request
      expect(response).to render_template(:index)
    end
  end
  describe '#show' do
    let(:novel) { create(:novel) }

    def do_request
      get :show, params: { id: novel.id }
    end

    it 'response is success' do
      do_request
      expect(response).to have_http_status(200)
    end

    it 'assigns a novel to @novel' do
      do_request
      expect(assigns(:novel)).to eq novel
    end

    it 'renders the :show template' do
      do_request
      expect(response).to render_template(:show)
    end
  end
  describe '#search' do
    let(:novel) { create(:novel, title: "I'm Chris Lin!!") }
    it 'response is success'
  end
end
