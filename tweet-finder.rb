require 'punkt-segmenter'

#Drop in a string
puts "Gimme me some text:"
text = gets.chomp

# Set tokenizer with Punkt
tokenizer = Punkt::SentenceTokenizer.new(text)

#Break it into sentences
sentences = tokenizer.sentences_from_text(text, :output => :sentences_text)

tweets = []
sentences.each do |sentence|
  if sentence.length <= 140
    tweets << sentence
  end
end

to_print = "TWEEEEEEETTTTTTSSS\n\n"
tweets.each do |tweet|
  to_print += "Length: #{tweet.length} | #{tweet}\n\n"
end

File.write("tweets.txt", to_print)
