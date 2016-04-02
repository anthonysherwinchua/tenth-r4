require 'rails_helper'

RSpec.describe Admin::BloodTypesController, type: :controller do

  include_examples "admin-only controller"

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:blood_types) { create_list(:blood_type, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(blood_types) }

  end

  describe 'GET #show' do

    let!(:blood_type) { create(:blood_type) }

    before { get :show, id: blood_type }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(blood_type) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(BloodType) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:blood_type_attrs) { attributes_for(:blood_type) }

      before { post :create, blood_type: blood_type_attrs }

      it { is_expected.to redirect_to(admin_blood_types_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:blood_type_attrs) { attributes_for(:blood_type, :invalid) }

      before { post :create, blood_type: blood_type_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:blood_type) { create(:blood_type) }

    before { get :edit, id: blood_type }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:blood_type) { create(:blood_type) }
      let(:blood_type_attrs) { attributes_for(:blood_type) }

      before { put :update, id: blood_type, blood_type: blood_type_attrs }

      it { is_expected.to redirect_to(admin_blood_types_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:blood_type) { create(:blood_type) }
      let(:blood_type_attrs) { attributes_for(:blood_type, :invalid) }

      before { put :update, id: blood_type, blood_type: blood_type_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:blood_type) { create(:blood_type) }

    before { delete :destroy, id: blood_type }

    it { is_expected.to redirect_to(admin_blood_types_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
