puts 'Seeding data...'

10.times do 
    User.create(
        username: Faker::Internet.username.capitalize,
        password: Faker::Alphanumeric.alpha(number: rand(7..10))
    )
end

30.times do
    Comment.create(
        comment: Faker::Lorem.sentence.capitalize,
        user_id: rand(User.first.id..User.last.id),
        watch_id: rand(Watch.first.id..Watch.last.id)
    )
end

puts 'Done Seeding!'