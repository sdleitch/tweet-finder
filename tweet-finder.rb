require "punkt-segmenter"
require "nokogiri"
require "open-uri"

#Drop in a URL
puts "Gimme a URL:"
url = gets.chomp

#Parse raw HTML from URL, save it to doc.
doc = Nokogiri::HTML(open(url))
#Find 'p' tags and save their content to text
text = doc.css('p').text

# puts text

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
