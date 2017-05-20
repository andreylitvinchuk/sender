require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    describe "when user authorized" do
      login_admin
      it 'render index' do
        subject { get :index }

        expect(subject).to have_http_status(:success)
        expect(subject).to have_rendered :index
      end
    end

    it "for non-authorized user" do
      expect(subject).to have_http_status(:redirect)
      expect(subject).to redirect_to new_user_session_path
      # puts response.methods
    end
  end

end
