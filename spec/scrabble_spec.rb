require "spec_helper"
require "./lib/scrabble"

describe Scrabble::Scrabble do
  it "responds to class method called score" do
    expect(Scrabble::Scrabble).to respond_to :score
  end

  it "responds with score values for all letters" do
    ("a".."z").each do |letter|
      score_value = Scrabble::Scrabble.score(letter)
      lookup_value = Scrabble::LETTER_VALUES.fetch(letter.to_sym)

      expect(score_value).to eq(lookup_value)
    end # loop
  end # it

  context "when scoring words" do
    words_and_scores = {
      "apple" => 9,
      "letters" => 7,
      "LETTERS" => 7,
      "pAsTaS" => 8
      }
    words_and_scores.each do |word, score|
      it "scores #{word} at #{score}" do
        expect(Scrabble::Scrabble.score(word)).to eq(score)
      end
    end
  end # context

  it "responds to the class method highest_score_from" do
    expect(Scrabble::Scrabble).to respond_to :highest_score_from
  end

  context "when finding the highest scoring word" do
    it "returns the highest scoring word from an array of words" do
      array_of_words = ["no","yes"] #=> [2, 6] should return "yes"
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("yes")    
    end

    it "returns the shorter word if there's a tie" do
      array_of_words = ["letter", "letters", "pasta"] #=> [6,7,7] get "pasta"
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("pasta")      
    end
  end
end #describe
