FactoryGirl.define do
  
  factory :user do
    
    email { "#{SecureRandom.hex(8)}@mailinator.com" } # mail can be actually checked at mailinator.com.
    name { Faker::Name.first_name }
    
    transient do
      locale "en" # I will add later a field to locale to the user. 
    end
      
  end
  
end