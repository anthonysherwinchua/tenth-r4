require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:users) { create_list(:user, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq([user] + users) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(User) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:user_attrs) { attributes_for(:user) }

      before { post :create, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:user_attrs) { attributes_for(:user, :invalid) }

      before { post :create, user: user_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:user) { create(:user) }

    before { get :edit, id: user }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:user) { create(:user) }
      let(:user_attrs) { attributes_for(:user) }

      before { put :update, id: user, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:user) { create(:user) }
      let(:user_attrs) { attributes_for(:user, :invalid) }

      before { put :update, id: user, user: user_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:user) { create(:user) }

    before { delete :destroy, id: user }

    it { is_expected.to redirect_to(admin_users_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
