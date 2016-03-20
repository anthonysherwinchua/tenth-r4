require 'rails_helper'

RSpec.describe Admin::LanguagesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:languages) { create_list(:language, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(languages) }

  end

  describe 'GET #show' do

    let!(:language) { create(:language) }

    before { get :show, id: language }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(language) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Language) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:language_attrs) { attributes_for(:language) }

      before { post :create, language: language_attrs }

      it { is_expected.to redirect_to(admin_languages_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:language_attrs) { attributes_for(:language, :invalid) }

      before { post :create, language: language_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:language) { create(:language) }

    before { get :edit, id: language }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:language) { create(:language) }
      let(:language_attrs) { attributes_for(:language) }

      before { put :update, id: language, language: language_attrs }

      it { is_expected.to redirect_to(admin_languages_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:language) { create(:language) }
      let(:language_attrs) { attributes_for(:language, :invalid) }

      before { put :update, id: language, language: language_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:language) { create(:language) }

    before { delete :destroy, id: language }

    it { is_expected.to redirect_to(admin_languages_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
