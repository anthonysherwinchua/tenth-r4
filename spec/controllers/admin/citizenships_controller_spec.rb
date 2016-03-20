require 'rails_helper'

RSpec.describe Admin::CitizenshipsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:citizenships) { create_list(:citizenship, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(citizenships) }

  end

  describe 'GET #show' do

    let!(:citizenship) { create(:citizenship) }

    before { get :show, id: citizenship }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(citizenship) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Citizenship) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:citizenship_attrs) { attributes_for(:citizenship) }

      before { post :create, citizenship: citizenship_attrs }

      it { is_expected.to redirect_to(admin_citizenships_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:citizenship_attrs) { attributes_for(:citizenship, :invalid) }

      before { post :create, citizenship: citizenship_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:citizenship) { create(:citizenship) }

    before { get :edit, id: citizenship }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:citizenship) { create(:citizenship) }
      let(:citizenship_attrs) { attributes_for(:citizenship) }

      before { put :update, id: citizenship, citizenship: citizenship_attrs }

      it { is_expected.to redirect_to(admin_citizenships_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:citizenship) { create(:citizenship) }
      let(:citizenship_attrs) { attributes_for(:citizenship, :invalid) }

      before { put :update, id: citizenship, citizenship: citizenship_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:citizenship) { create(:citizenship) }

    before { delete :destroy, id: citizenship }

    it { is_expected.to redirect_to(admin_citizenships_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
