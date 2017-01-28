# Register users with password so that they can log in.
3.times do |i|
  user = User.create!(
    email:    "user#{i + 1}@example.com",
    password: "password"
  )

  # Each user writes a few post.
  6.times do
    post = user.posts.create!(
      title:   Faker::Hacker.say_something_smart,
      body:    Faker::Lorem.paragraph,
    )
  end
end

# Each user writes a few comments.
posts = Post.all
User.all.each do |user|
  3.times do
    user.comments.create!(
      content: Faker::Lorem.paragraph,
      post: posts.sample
    )
  end
end

# Each user likes a few posts and a few comments.
posts    = Post.all
comments = Comment.all
User.all.each do |user|
  3.times { Like.create!(user: user, likable: posts.sample) }
  3.times { Like.create!(user: user, likable: comments.sample) }
end
