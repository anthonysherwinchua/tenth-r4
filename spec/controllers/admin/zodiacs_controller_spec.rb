require 'rails_helper'

RSpec.describe Admin::ZodiacsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:zodiacs) { create_list(:zodiac, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(zodiacs) }

  end

  describe 'GET #show' do

    let!(:zodiac) { create(:zodiac) }

    before { get :show, id: zodiac }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(zodiac) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Zodiac) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:zodiac_attrs) { attributes_for(:zodiac) }

      before { post :create, zodiac: zodiac_attrs }

      it { is_expected.to redirect_to(admin_zodiacs_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:zodiac_attrs) { attributes_for(:zodiac, :invalid) }

      before { post :create, zodiac: zodiac_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:zodiac) { create(:zodiac) }

    before { get :edit, id: zodiac }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:zodiac) { create(:zodiac) }
      let(:zodiac_attrs) { attributes_for(:zodiac) }

      before { put :update, id: zodiac, zodiac: zodiac_attrs }

      it { is_expected.to redirect_to(admin_zodiacs_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:zodiac) { create(:zodiac) }
      let(:zodiac_attrs) { attributes_for(:zodiac, :invalid) }

      before { put :update, id: zodiac, zodiac: zodiac_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:zodiac) { create(:zodiac) }

    before { delete :destroy, id: zodiac }

    it { is_expected.to redirect_to(admin_zodiacs_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
