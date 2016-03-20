require 'rails_helper'

RSpec.describe Admin::ContactTypesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:contact_types) { create_list(:contact_type, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(contact_types) }

  end

  describe 'GET #show' do

    let!(:contact_type) { create(:contact_type) }

    before { get :show, id: contact_type }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(contact_type) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(ContactType) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:contact_type_attrs) { attributes_for(:contact_type) }

      before { post :create, contact_type: contact_type_attrs }

      it { is_expected.to redirect_to(admin_contact_types_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:contact_type_attrs) { attributes_for(:contact_type, :invalid) }

      before { post :create, contact_type: contact_type_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:contact_type) { create(:contact_type) }

    before { get :edit, id: contact_type }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:contact_type) { create(:contact_type) }
      let(:contact_type_attrs) { attributes_for(:contact_type) }

      before { put :update, id: contact_type, contact_type: contact_type_attrs }

      it { is_expected.to redirect_to(admin_contact_types_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:contact_type) { create(:contact_type) }
      let(:contact_type_attrs) { attributes_for(:contact_type, :invalid) }

      before { put :update, id: contact_type, contact_type: contact_type_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:contact_type) { create(:contact_type) }

    before { delete :destroy, id: contact_type }

    it { is_expected.to redirect_to(admin_contact_types_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
