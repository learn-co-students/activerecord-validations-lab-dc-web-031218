require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :key_words_in_title


  def key_words_in_title
    if title
      key_words = ["Top", "Won\'t Believe", "Secret", "Guess"]
      # binding.pry
      if key_words.select {|word| title.include?(word)} == []
        errors.add(:title_key_words, "title doesnt include a keyphrase")
      end
    end
  end





end
