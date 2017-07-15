require 'random_data'

# Create Users
5.times do
  User.create!(
# # we wishful-coded two methods that we'll need to add to RandomData
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end

moderator = User.create!(
    name:      'Moderator User',
    email:     'moderator@example.com',
    password:  'helloworld',
    role:      'moderator'
)

users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
# #1 Adding a ! instructs the method to raise an error if there's a problem with the data we're seeding. Using create without a bang could fail without warning, causing the error to surface later
  Post.create!(
# #2 we use methods from a class that does not exist yet, RandomData, that will create random strings for title and body
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

posts = Post.all

# Create Comments
# #3 we call times on an Integer (a number object). This will run a given block the specified number of times, which is 100 in this case
100.times do
  Comment.create!(
# #4 we call sample on the array returned by Post.all, in order to pick a random post to associate each comment with
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
