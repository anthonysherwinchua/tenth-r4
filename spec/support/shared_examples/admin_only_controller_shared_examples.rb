RSpec.shared_examples 'admin-only controller' do
  context 'encoder is logged in' do
    let(:encoder) { create(:user, :encoder) }

    before { sign_in encoder }

    it { expect(get :index).to redirect_to root_path }
  end
end
