require 'rails_helper'

RSpec.describe Admin::CountriesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:countries) { create_list(:country, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(countries) }

  end

  describe 'GET #show' do

    let!(:country) { create(:country) }

    before { get :show, id: country }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(country) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Country) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:country_attrs) { attributes_for(:country) }

      before { post :create, country: country_attrs }

      it { is_expected.to redirect_to(admin_countries_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:country_attrs) { attributes_for(:country, :invalid) }

      before { post :create, country: country_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:country) { create(:country) }

    before { get :edit, id: country }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:country) { create(:country) }
      let(:country_attrs) { attributes_for(:country) }

      before { put :update, id: country, country: country_attrs }

      it { is_expected.to redirect_to(admin_countries_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:country) { create(:country) }
      let(:country_attrs) { attributes_for(:country, :invalid) }

      before { put :update, id: country, country: country_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:country) { create(:country) }

    before { delete :destroy, id: country }

    it { is_expected.to redirect_to(admin_countries_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
