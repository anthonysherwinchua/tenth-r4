require 'rails_helper'

RSpec.describe Admin::ReligionsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:religions) { create_list(:religion, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(religions) }

  end

  describe 'GET #show' do

    let!(:religion) { create(:religion) }

    before { get :show, id: religion }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(religion) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Religion) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:religion_attrs) { attributes_for(:religion) }

      before { post :create, religion: religion_attrs }

      it { is_expected.to redirect_to(admin_religions_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:religion_attrs) { attributes_for(:religion, :invalid) }

      before { post :create, religion: religion_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:religion) { create(:religion) }

    before { get :edit, id: religion }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:religion) { create(:religion) }
      let(:religion_attrs) { attributes_for(:religion) }

      before { put :update, id: religion, religion: religion_attrs }

      it { is_expected.to redirect_to(admin_religions_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:religion) { create(:religion) }
      let(:religion_attrs) { attributes_for(:religion, :invalid) }

      before { put :update, id: religion, religion: religion_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:religion) { create(:religion) }

    before { delete :destroy, id: religion }

    it { is_expected.to redirect_to(admin_religions_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
