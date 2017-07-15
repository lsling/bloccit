# #5 we define RandomData as a module because it is a standalone library with no dependencies or inheritance requirements
module RandomData
  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end
  
# #6 we define random_paragraph. We set sentences to an array
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

# #7 we follow the same pattern as we did in #6 to create a sentence with a random number of words
  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

# #8 We set letters to an array of the letters a through  z using to_a
  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
