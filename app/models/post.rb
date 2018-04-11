require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  def non_clickbait
    if title
      phrases = ["Won't Believe", "Secret", "Top", "Guess"]
      arr = phrases.select do |phrase|
        self.title.include?(phrase)
      end
      if arr.length == 0
        errors.add(:title, "Doesn't include clickbait")
      end
    end
  end
  validate :non_clickbait
end
