5.times {
  User.find_or_create_by(email: Faker::Internet.email) do |u|
    u.password = '123456'
  end
}