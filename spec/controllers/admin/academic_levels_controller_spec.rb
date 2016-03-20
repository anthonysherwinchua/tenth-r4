require 'rails_helper'

RSpec.describe Admin::AcademicLevelsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:academic_levels) { create_list(:academic_level, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(academic_levels) }

  end

  describe 'GET #show' do

    let!(:academic_level) { create(:academic_level) }

    before { get :show, id: academic_level }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(academic_level) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(AcademicLevel) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:academic_level_attrs) { attributes_for(:academic_level) }

      before { post :create, academic_level: academic_level_attrs }

      it { is_expected.to redirect_to(admin_academic_levels_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:academic_level_attrs) { attributes_for(:academic_level, :invalid) }

      before { post :create, academic_level: academic_level_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:academic_level) { create(:academic_level) }

    before { get :edit, id: academic_level }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:academic_level) { create(:academic_level) }
      let(:academic_level_attrs) { attributes_for(:academic_level) }

      before { put :update, id: academic_level, academic_level: academic_level_attrs }

      it { is_expected.to redirect_to(admin_academic_levels_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:academic_level) { create(:academic_level) }
      let(:academic_level_attrs) { attributes_for(:academic_level, :invalid) }

      before { put :update, id: academic_level, academic_level: academic_level_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:academic_level) { create(:academic_level) }

    before { delete :destroy, id: academic_level }

    it { is_expected.to redirect_to(admin_academic_levels_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
