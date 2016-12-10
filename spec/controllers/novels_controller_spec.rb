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
      # voting_novels
      do_request
      novels = create_list(:novel, 3)
      expect(assigns(:contributing_novels)).to eq novels
    end

    it 'assigns a list of voting_novels to @voting_novels' do
      do_request
      novels = []
      3.times do
        novels << create(:novel, status: 1)
      end
      expect(assigns(:voting_novels)).to eq novels
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
    def do_request(str = '')
      get :search, params: { q: str}
    end

    context "with valid params" do
      it 'response is success' do
        do_request
        expect(response).to have_http_status(200)
      end
      it 'assigns a result to @novels' do
        do_request('Chris')
        expect(assigns(:novels)).to match_array [novel]
      end
    end

    context 'with invalid params' do
      it 'assigns nil to @novels' do
        do_request
        expect(assigns(:novels)).to be_nil
      end
      it 'response is success' do
        do_request
        expect(response).to have_http_status(200)
      end
    end
  end
end
