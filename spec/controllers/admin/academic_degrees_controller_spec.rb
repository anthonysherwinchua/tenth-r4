require 'rails_helper'

RSpec.describe Admin::AcademicDegreesController, type: :controller do

  let(:user) { create(:user) }
  let(:academic_level) { create(:academic_level) }
  let!(:academic_degree) { create(:academic_degree, academic_level_id: academic_level.id) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:academic_degrees) { create_list(:academic_degree, count, academic_level_id: academic_level.id) }

    before { get :index, academic_level_id: academic_level.id }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items)).to eq([academic_degree] + academic_degrees) }

  end

  describe 'GET #show' do

    before { get :show, id: academic_degree, academic_level_id: academic_level.id  }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:current_item)).to eq(academic_degree) }

  end

  describe 'GET #new' do

    before { get :new, academic_level_id: academic_level.id  }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(AcademicDegree) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:academic_degree_attrs) { attributes_for(:academic_degree) }

      before { post :create, academic_degree: academic_degree_attrs, academic_level_id: academic_level.id  }

      it { is_expected.to redirect_to(admin_academic_level_academic_degrees_path(academic_level_id: academic_level.id)) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:academic_degree_attrs) { attributes_for(:academic_degree, :invalid) }

      before { post :create, academic_degree: academic_degree_attrs, academic_level_id: academic_level.id  }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    before { get :edit, id: academic_degree, academic_level_id: academic_level.id  }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:academic_degree_attrs) { attributes_for(:academic_degree) }

      before { put :update, id: academic_degree, academic_degree: academic_degree_attrs, academic_level_id: academic_level.id  }

      it { is_expected.to redirect_to(admin_academic_level_academic_degrees_path(academic_level_id: academic_level.id)) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:academic_degree_attrs) { attributes_for(:academic_degree, :invalid) }

      before { put :update, id: academic_degree, academic_degree: academic_degree_attrs, academic_level_id: academic_level.id  }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    before { delete :destroy, id: academic_degree, academic_level_id: academic_level.id  }

    it { is_expected.to redirect_to(admin_academic_level_academic_degrees_path(academic_level_id: academic_level.id)) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
