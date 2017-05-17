RSpec.describe Api::Respira::V1::RecordingsController, type: :controller do
  
  describe 'recrodings#index' do
    
    let!(:user){ FactoryGirl.create :user }
    let!(:recording){ FactoryGirl.create :recording, user: user }
    
    def the_action  
      get :index, format: :json
    end
    
    def json
      JSON.parse(response.body)
    end 
    
    before {
      the_action
    }
      
    it 'should respond with correct body response' do
      expect(json.first['description']).to eq recording.description
      expect(json.first['data']).to eq recording.data
    end
    
    it 'returns status code 200' do
      expect(response.status).to eq(200) 
    end
    
  end
end
