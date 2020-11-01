# User.create!(email: 'admin@example.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
# user = User.new(
#   email: 'admin@example.com',
#   password: 'asdfasdf',
#   password_confirmation: 'asdfasdf'
# )
# user.skip_confirmation!
# user.save!

PublicActivity.enabled = false
30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 20000)
  }])
end
PublicActivity.enabled = true
