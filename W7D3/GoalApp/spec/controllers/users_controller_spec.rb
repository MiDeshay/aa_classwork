require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end


    describe 'POST #create' do
        context 'with valid params' do
            let(:user_params) do {
                user: {
                    username: 'Capy3',
                    email: "capy3@gmail.com",
                    password: "password",
                }
            }
         end

         it 'logs in the user' do
            post :create, params: user_params

            user = User.find_by(username: 'Capy3')
            expect(session[:session_token]).to eq(user.session_token)
         end

         it 'redirects to the users show page' do
            post :create, params: user_params

            user = User.find_by(username: 'Capy3')
            expect(response).to redirect_to(user_url(user))
         end

        end

        
    end
end