describe "User registration" do
  
  let(:user){ FactoryGirl.build :user }
  
  before {
    visit new_user_registration_path
  }
  
  it 'creates a new user' do
    
    find("#user_email").set user.email
    find("#user_password").set user.password
      
    expect {
      find("input[type='submit']").click
    }.to change {
      User.count
    }.by(1)
    
  end
  
end