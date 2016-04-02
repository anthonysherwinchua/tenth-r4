require 'rails_helper'

RSpec.describe Admin::JobOpeningsController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:job_openings) { create_list(:job_opening, count) }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq(job_openings) }

  end

  describe 'GET #show' do

    let!(:job_opening) { create(:job_opening) }

    before { get :show, id: job_opening }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(job_opening) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(JobOpening) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let!(:occupation) { create(:occupation) }
      let!(:country) { create(:country) }
      let(:job_opening_attrs) { attributes_for(:job_opening).merge(occupation_id: occupation.id, country_id: country.id) }

      before { post :create, job_opening: job_opening_attrs }

      it { is_expected.to redirect_to(admin_job_openings_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:job_opening_attrs) { attributes_for(:job_opening, :invalid) }

      before { post :create, job_opening: job_opening_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:job_opening) { create(:job_opening) }

    before { get :edit, id: job_opening }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:job_opening) { create(:job_opening) }
      let!(:occupation) { create(:occupation) }
      let!(:country) { create(:country) }
      let(:job_opening_attrs) { attributes_for(:job_opening).merge(occupation_id: occupation.id, country_id: country.id) }

      before { put :update, id: job_opening, job_opening: job_opening_attrs }

      it { is_expected.to redirect_to(admin_job_openings_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:job_opening) { create(:job_opening) }
      let(:job_opening_attrs) { attributes_for(:job_opening, :invalid) }

      before { put :update, id: job_opening, job_opening: job_opening_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:job_opening) { create(:job_opening) }

    before { delete :destroy, id: job_opening }

    it { is_expected.to redirect_to(admin_job_openings_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
