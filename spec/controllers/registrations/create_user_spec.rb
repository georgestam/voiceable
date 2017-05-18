RSpec.describe RegistrationsController, type: :controller do

  describe 'Users#create' do
    
    let!(:user){ FactoryGirl.build :user }
    
    def json
      JSON.parse(response.body)
    end
    
    context 'when a correct params are given' do 
      
      let(:params) { { {
        email: user.email,
        password: user.password
      } } }
        
      def the_action 
        request.env["devise.mapping"] = Devise.mappings[:user] 
        post :create, params: params, format: :json
      end
  
      it 'should create a new user' do
        expect {
          the_action
        }.to change { 
          User.count
        }.by(1)
      end
      
      it 'should return a token' do
        expect {
          the_action
        }.to change { 
          user.authentication_token
        }.from(false).to(true)
      end
      
      it 'returns status code 200' do
        the_action
        expect(response.status).to eq(200) 
      end
    
    end
  end
end