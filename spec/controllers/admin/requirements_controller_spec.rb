require 'rails_helper'

RSpec.describe Admin::RequirementsController, type: :controller do

  let(:user) { create(:user) }
  let(:job_opening) { create(:job_opening) }
  let!(:requirement) { create(:requirement, job_opening_id: job_opening.id) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:requirements) { create_list(:requirement, count, job_opening_id: job_opening.id) }

    before { get :index, job_opening_id: job_opening.id }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq([requirement] + requirements) }

  end

  describe 'GET #show' do

    before { get :show, id: requirement, job_opening_id: job_opening.id }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(requirement) }

  end

  describe 'GET #new' do

    before { get :new, job_opening_id: job_opening.id }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Requirement) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:document) { create(:document) }
      let(:requirement_attrs) { attributes_for(:requirement).merge(document_id: document.id) }

      before { post :create, requirement: requirement_attrs, job_opening_id: job_opening.id }

      it { is_expected.to redirect_to(admin_job_opening_requirements_path(job_opening_id: job_opening.id)) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:requirement_attrs) { attributes_for(:requirement, :invalid) }

      before { post :create, requirement: requirement_attrs, job_opening_id: job_opening.id }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    before { get :edit, id: requirement, job_opening_id: job_opening.id }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:requirement_attrs) { attributes_for(:requirement) }

      before { put :update, id: requirement, requirement: requirement_attrs, job_opening_id: job_opening.id }

      it { is_expected.to redirect_to(admin_job_opening_requirements_path(job_opening_id: job_opening.id)) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let!(:existing_requirement) { create(:requirement, job_opening_id: job_opening.id) }

      let(:requirement_attrs) { attributes_for(:requirement, :invalid).merge(document_id: existing_requirement.document.id) }

      before { put :update, id: requirement, requirement: requirement_attrs, job_opening_id: job_opening.id }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    before { delete :destroy, id: requirement, job_opening_id: job_opening.id }

    it { is_expected.to redirect_to(admin_job_opening_requirements_path(job_opening_id: job_opening.id)) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end
end
