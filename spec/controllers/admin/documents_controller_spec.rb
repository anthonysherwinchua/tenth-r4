require 'rails_helper'

RSpec.describe Admin::DocumentsController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:documents) { create_list(:document, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(documents) }

  end

  describe 'GET #show' do

    let!(:document) { create(:document) }

    before { get :show, id: document }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(document) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Document) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:document_attrs) { attributes_for(:document) }

      before { post :create, document: document_attrs }

      it { is_expected.to redirect_to(admin_documents_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:document_attrs) { attributes_for(:document, :invalid) }

      before { post :create, document: document_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:document) { create(:document) }

    before { get :edit, id: document }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:document) { create(:document) }
      let(:document_attrs) { attributes_for(:document) }

      before { put :update, id: document, document: document_attrs }

      it { is_expected.to redirect_to(admin_documents_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:document) { create(:document) }
      let(:document_attrs) { attributes_for(:document, :invalid) }

      before { put :update, id: document, document: document_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:document) { create(:document) }

    before { delete :destroy, id: document }

    it { is_expected.to redirect_to(admin_documents_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
