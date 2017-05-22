RSpec.describe RegistrationsController, type: :controller do

  describe 'Users#create' do
    
    let!(:reference){ FactoryGirl.build :user }
    
    def response_object
      JSON.parse(response.body)
    end
    
    before {
      devise_mapping_for_rspec
    }
    
    context 'when a correct params are given' do 
      
      let(:right_params) { 
        { 
          user: {
            email: reference.email,
            password: reference.password
            } 
          } 
      }
        
      def the_action 
        post :create, params: right_params, format: :json
      end
  
      it 'should create a new user' do
        expect {
          the_action
        }.to change { 
          User.count
        }.by(1)
      end
      
      it 'should create a token in the user table' do
        expect { 
          the_action 
        }.to change { 
          User.first.try(:authentication_token).present? 
        }.from(false).to(true)
      end
      
      it 'should have created a token as a string' do
        the_action
        expect(User.first.authentication_token).to be_kind_of(String)
      end
      
      it 'returns status code 201' do
        the_action
        expect(response.status).to eq(201) 
      end
    
    end
    
    context 'when wrong params are given' do 
      
      let(:wrong_params) { 
        { 
          user: {
            email: "wrong@email",
            password: "tooshort"
            } 
          } 
      }
        
      def the_action  
        post :create, params: wrong_params, format: :json
      end
  
      it 'should not create a new user' do
        expect { the_action }.to_not change(User, :count) # use this sintax (rather than User.count) in order top please rubocop
      end
      
      it 'returns status code 422' do
        the_action
        expect(response.status).to eq(422) 
      end
    
    end
  end
end