require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email {Faker::Internet.email}
  password {'password'}
  password_confirmation {'password'}
end

Poll.blueprint do
  title {Faker::Name.name}
  description {Faker::Company.bs}
  user
end

Question.blueprint do
  title {"What's your question?"}
end

Answer.blueprint do
  title {"This is an answer"}
end

SMS.blueprint do
  from {"+13473217539"}
  to {(Faker::PhoneNumber.cell_phone).to_s}
  body {'23s'}
end

