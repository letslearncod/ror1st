# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Form.create!(
    title: Faker::Movie.title,
    detail: Faker::Movie.quote
  )
end

form_ids = Form.ids

15.times do
  Question.create!(
    form_id: form_ids.sample,
    title: Faker::Name.unique.name,
    desc: Faker::Superhero.power,
    questiontype: rand(1..4)
  )
end

question_ids = Question.ids

60.times do
  Choice.create!(
    question_id: question_ids.sample,
    answer: Faker::Book.title,
    checked: rand(0..1)
  )
end
