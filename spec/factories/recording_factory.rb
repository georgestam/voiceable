FactoryGirl.define do
  
  factory :recording do
    
    user
    data { "some json parsed to a string" } # mail can be actually checked at mailinator.com.
    description { Faker::ChuckNorris.fact }
      
  end
  
end