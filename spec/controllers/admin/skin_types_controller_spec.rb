require 'rails_helper'

RSpec.describe Admin::SkinTypesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:skin_types) { create_list(:skin_type, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(skin_types) }

  end

  describe 'GET #show' do

    let!(:skin_type) { create(:skin_type) }

    before { get :show, id: skin_type }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(skin_type) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(SkinType) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:skin_type_attrs) { attributes_for(:skin_type) }

      before { post :create, skin_type: skin_type_attrs }

      it { is_expected.to redirect_to(admin_skin_types_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:skin_type_attrs) { attributes_for(:skin_type, :invalid) }

      before { post :create, skin_type: skin_type_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:skin_type) { create(:skin_type) }

    before { get :edit, id: skin_type }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:skin_type) { create(:skin_type) }
      let(:skin_type_attrs) { attributes_for(:skin_type) }

      before { put :update, id: skin_type, skin_type: skin_type_attrs }

      it { is_expected.to redirect_to(admin_skin_types_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:skin_type) { create(:skin_type) }
      let(:skin_type_attrs) { attributes_for(:skin_type, :invalid) }

      before { put :update, id: skin_type, skin_type: skin_type_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:skin_type) { create(:skin_type) }

    before { delete :destroy, id: skin_type }

    it { is_expected.to redirect_to(admin_skin_types_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
