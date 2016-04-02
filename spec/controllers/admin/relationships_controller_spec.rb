require 'rails_helper'

RSpec.describe Admin::RelationshipsController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:relationships) { create_list(:relationship, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(relationships) }

  end

  describe 'GET #show' do

    let!(:relationship) { create(:relationship) }

    before { get :show, id: relationship }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(relationship) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Relationship) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:relationship_attrs) { attributes_for(:relationship) }

      before { post :create, relationship: relationship_attrs }

      it { is_expected.to redirect_to(admin_relationships_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:relationship_attrs) { attributes_for(:relationship, :invalid) }

      before { post :create, relationship: relationship_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:relationship) { create(:relationship) }

    before { get :edit, id: relationship }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:relationship) { create(:relationship) }
      let(:relationship_attrs) { attributes_for(:relationship) }

      before { put :update, id: relationship, relationship: relationship_attrs }

      it { is_expected.to redirect_to(admin_relationships_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:relationship) { create(:relationship) }
      let(:relationship_attrs) { attributes_for(:relationship, :invalid) }

      before { put :update, id: relationship, relationship: relationship_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:relationship) { create(:relationship) }

    before { delete :destroy, id: relationship }

    it { is_expected.to redirect_to(admin_relationships_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
