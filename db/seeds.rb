User.create(
  name: "letuananh",
  email: "letuanh821993@gmail.com",
  address: "ha noi",
  password: "123456",
  phone_number: "0987654321",
  role: :admin
)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  password = "123456"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

User.create!(name: "buiquyhoat",
  email: "buiquyhoat@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: :admin)

10.times do |_n|
  name = Faker::Name.name
  Category.create!(name: name)
end

20.times do |_n|
  name = Faker::Name.name
  category_id = rand(Category.all.size) + 1
  user_id = rand(User.all.size) + 1
  Document.create!(name: name,
    category_id: category_id,
    user_id: user_id, status: :Checked)
end
