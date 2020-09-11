# config: utf-8

User.create!(name: " 管理者",
  email: "sample@email.com",
  tel: "0120123123",
  prefecture: "大阪府",
  introduction: "管理者",
  password: "password",
  password_confirmation: "password",
  admin: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  tel = "012000000" + "#{n+1}"
  password = "password"
  User.create!(name: name,
               email: email,
               tel: tel,
               password: password,
               password_confirmation: password)
end