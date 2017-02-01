Like.delete_all
Comment.delete_all
Post.delete_all
User.delete_all

# Register users with password so that they can log in.
masa = User.create!(
  email:    "nishiguchi.masa@gmail.com",
  password: "password"
)
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
  30.times do
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
  30.times { posts.sample.set_liked_by(user) }
  30.times { comments.sample.set_liked_by(user)  }
end
