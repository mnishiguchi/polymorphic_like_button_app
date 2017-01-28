3.times do |i|
  user = User.create!(
    email:    "user#{i + 1}@example.com",
    password: "password"
  )

  3.times do
    user.posts.create!(
      title:   Faker::Hacker.say_something_smart,
      body:    Faker::Lorem.paragraph,
      user_id: user.id
    )
  end

  # user.likes.create(post_id: user.posts.take(1)[0].id)
end
