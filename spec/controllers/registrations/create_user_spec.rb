RSpec.describe RegistrationsController, type: :controller do

  describe 'Users#create' do
    
    let!(:reference){ FactoryGirl.build :user }
    
    def json
      JSON.parse(response.body)
    end
    
    context 'when a correct params are given' do 
      
      let(:params) { 
        { 
          user: {
            email: reference.email,
            password: reference.password
            } 
          } 
        }
        
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
      
      it 'should create a token in the user table' do
        the_action
        expect(User.first.authentication_token).to be_kind_of(String)
      end
      
      it 'returns status code 201' do
        the_action
        expect(response.status).to eq(201) 
      end
    
    end
  end
end