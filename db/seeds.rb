# create default admin user
User.find_or_create_by(email: 'eddie@5xruby.tw') do |u|
  u.password = '123456'
  u.role = 'admin'
end
