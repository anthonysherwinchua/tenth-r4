require 'rails_helper'

RSpec.describe Admin::CivilStatusesController, type: :controller do

  include_examples "admin-only controller"

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:civil_statuses) { create_list(:civil_status, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(civil_statuses) }

  end

  describe 'GET #show' do

    let!(:civil_status) { create(:civil_status) }

    before { get :show, id: civil_status }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(civil_status) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(CivilStatus) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:civil_status_attrs) { attributes_for(:civil_status) }

      before { post :create, civil_status: civil_status_attrs }

      it { is_expected.to redirect_to(admin_civil_statuses_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:civil_status_attrs) { attributes_for(:civil_status, :invalid) }

      before { post :create, civil_status: civil_status_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:civil_status) { create(:civil_status) }

    before { get :edit, id: civil_status }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:civil_status) { create(:civil_status) }
      let(:civil_status_attrs) { attributes_for(:civil_status) }

      before { put :update, id: civil_status, civil_status: civil_status_attrs }

      it { is_expected.to redirect_to(admin_civil_statuses_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:civil_status) { create(:civil_status) }
      let(:civil_status_attrs) { attributes_for(:civil_status, :invalid) }

      before { put :update, id: civil_status, civil_status: civil_status_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:civil_status) { create(:civil_status) }

    before { delete :destroy, id: civil_status }

    it { is_expected.to redirect_to(admin_civil_statuses_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
