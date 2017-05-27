describe 'User Logging in' do
  
  before {
    visit new_user_session_path
  }
  
  it "creates a new session" do
    expect(page).to have_selector :css, '#login'
  end
  
end