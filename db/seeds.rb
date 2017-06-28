require 'random_data'

# Create Posts
50.times do
# #1 Adding a ! instructs the method to raise an error if there's a problem with the data we're seeding. Using create without a bang could fail without warning, causing the error to surface later
  Post.create!(
# #2 we use methods from a class that does not exist yet, RandomData, that will create random strings for title and body
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

Post.find_or_create_by(title: "Laura's title", body: "Laura's text")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
