require 'rails_helper'

RSpec.describe Admin::BaseController, type: :controller do

  context 'not signed in' do

    before { get :dashboard }

    it 'has no current user' do
      expect(subject.current_user).to be_nil
    end

    it 'redirects to the login page' do
      expect(response).to redirect_to(new_user_session_path)
    end

  end

  context 'signed in' do
    let(:user) { create(:user) }

    before { sign_in user }
    before { get :dashboard }

    it 'has a current_user' do
      expect(subject.current_user).to be
    end

    it { is_expected.to render_template(:dashboard) }
  end

end
