require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe NewslettersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Newsletter. As you add validations to Newsletter, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'newsletter name',
      text: 'text',
      filters: [
        {
          prop_name: 'level',
          logic: 'gteq',
          value: '3'
        }
      ],
      start_at: DateTime.now
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      text: '',
      filters: [
        {
          prop_name: 'level',
          logic: 'wrong_logic',
          value: '-2'
        }
      ],
      start_at: DateTime.now
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NewslettersController. Be sure to keep this updated too.
  let(:valid_session) {{}}
  describe "when user authorized" do
    login_admin

    describe "GET #index" do
      it "assigns all newsletters as @newsletters" do
        newsletter = Newsletter.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:newsletters)).to eq([newsletter])
      end
    end

    describe "GET #show" do
      it "assigns the requested newsletter as @newsletter" do
        newsletter = Newsletter.create! valid_attributes
        get :show, params: {id: newsletter.to_param}, session: valid_session
        expect(assigns(:newsletter)).to eq(newsletter)
      end
    end

    describe "GET #new" do
      it "assigns a new newsletter as @newsletter" do
        get :new, params: {}, session: valid_session
        expect(assigns(:newsletter)).to be_a_new(Newsletter)
      end
    end

    describe "GET #edit" do
      it "assigns the requested newsletter as @newsletter" do
        newsletter = Newsletter.create! valid_attributes
        get :edit, params: {id: newsletter.to_param}, session: valid_session
        expect(assigns(:newsletter)).to eq(newsletter)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Newsletter" do
          expect {
            post :create, params: {newsletter: valid_attributes}, session: valid_session
          }.to change(Newsletter, :count).by(1)
        end

        it "assigns a newly created newsletter as @newsletter" do
          post :create, params: {newsletter: valid_attributes}, session: valid_session
          expect(assigns(:newsletter)).to be_a(Newsletter)
          expect(assigns(:newsletter)).to be_persisted
        end

        it "redirects to the created newsletter" do
          post :create, params: {newsletter: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Newsletter.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved newsletter as @newsletter" do
          post :create, params: {newsletter: invalid_attributes}, session: valid_session
          expect(assigns(:newsletter)).to be_a_new(Newsletter)
        end

        it "re-renders the 'new' template" do
          post :create, params: {newsletter: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested newsletter" do
          newsletter = Newsletter.create! valid_attributes
          put :update, params: {id: newsletter.to_param, newsletter: new_attributes}, session: valid_session
          newsletter.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested newsletter as @newsletter" do
          newsletter = Newsletter.create! valid_attributes
          put :update, params: {id: newsletter.to_param, newsletter: valid_attributes}, session: valid_session
          expect(assigns(:newsletter)).to eq(newsletter)
        end

        it "redirects to the newsletter" do
          newsletter = Newsletter.create! valid_attributes
          put :update, params: {id: newsletter.to_param, newsletter: valid_attributes}, session: valid_session
          expect(response).to redirect_to(newsletter)
        end
      end

      context "with invalid params" do
        it "assigns the newsletter as @newsletter" do
          newsletter = Newsletter.create! valid_attributes
          put :update, params: {id: newsletter.to_param, newsletter: invalid_attributes}, session: valid_session
          expect(assigns(:newsletter)).to eq(newsletter)
        end

        it "re-renders the 'edit' template" do
          newsletter = Newsletter.create! valid_attributes
          put :update, params: {id: newsletter.to_param, newsletter: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested newsletter" do
        newsletter = Newsletter.create! valid_attributes
        expect {
          delete :destroy, params: {id: newsletter.to_param}, session: valid_session
        }.to change(Newsletter, :count).by(-1)
      end

      it "redirects to the newsletters list" do
        newsletter = Newsletter.create! valid_attributes
        delete :destroy, params: {id: newsletter.to_param}, session: valid_session
        expect(response).to redirect_to(newsletters_url)
      end
    end
  end

  it "for non-authorized user" do
    get :index
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to new_user_session_path
  end

end
