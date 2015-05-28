require 'pry'

module Scrabble
  LETTER_VALUES = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4,
    g: 2, h: 4, i: 1, j: 8, k: 5,
    l: 1, m: 3, n: 1, o: 1, p: 3,
    q: 10, r: 1, s: 1, t: 1, u: 1,
    v: 4, w: 4, x: 8, y: 4, z: 10 }

  class Scrabble
    def self.score(word)
      points = 0

      # case insensitivity is a requirement
      # Break apart our word into letters
      letters = word.downcase.split('')

      # Iterate and score each letter
      letters.each do |letter|
        points += LETTER_VALUES[letter.to_sym]
      end

      # Return the sum of all letters
      return points
    end

    def self.highest_score_from(array_of_words)
      # score each word in the array
      score_groups = array_of_words.group_by do |word|
        score(word)
      end

      # figure out which score is the highest
      highest_score = score_groups.keys.max
      
      # return that _word_ (not the score) :)
      score_groups[highest_score].first
    end
  end
end
