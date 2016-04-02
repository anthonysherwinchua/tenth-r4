require 'rails_helper'

RSpec.describe Admin::OccupationsController, type: :controller do

  include_examples "admin-only controller"

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:occupations) { create_list(:occupation, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(occupations) }

  end

  describe 'GET #show' do

    let!(:occupation) { create(:occupation) }

    before { get :show, id: occupation }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(occupation) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Occupation) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:occupation_attrs) { attributes_for(:occupation) }

      before { post :create, occupation: occupation_attrs }

      it { is_expected.to redirect_to(admin_occupations_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:occupation_attrs) { attributes_for(:occupation, :invalid) }

      before { post :create, occupation: occupation_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:occupation) { create(:occupation) }

    before { get :edit, id: occupation }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:occupation) { create(:occupation) }
      let(:occupation_attrs) { attributes_for(:occupation) }

      before { put :update, id: occupation, occupation: occupation_attrs }

      it { is_expected.to redirect_to(admin_occupations_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:occupation) { create(:occupation) }
      let(:occupation_attrs) { attributes_for(:occupation, :invalid) }

      before { put :update, id: occupation, occupation: occupation_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:occupation) { create(:occupation) }

    before { delete :destroy, id: occupation }

    it { is_expected.to redirect_to(admin_occupations_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
