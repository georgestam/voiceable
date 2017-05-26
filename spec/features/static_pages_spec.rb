describe "Static pages" do

  describe "Home page" do
    
    before { 
      visit root_path
    }
    
    it 'finds front-page selector' do
      expect(page).to have_selector :css, '.front-page'
    end
    
    it 'returns status code 200' do
      page_ok
    end
  end

end