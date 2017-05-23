User.destroy_all
Recording.destroy_all

User.create!({
  email: "jordi@voiceable.io",
  password: "password10",
  admin: true
  })
  
2.times do
  Recording.create!({
    data: "some json",
    description: Faker::ChuckNorris.fact,
    user: User.first
    })
end 