class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :be_clickbait

  # ensures the title is sufficiently clickbait-y.
  # If the title does not contain "Won't Believe", "Secret",
  # "Top [number]", or "Guess", the validator should return false.

  def be_clickbait
    if title
      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
        errors.add(:be_clickbait, "needs to have clickbait")
      end
    end
  end
end
