class Post < ActiveRecord::Base
  # @@clickbait = ["Won\'t Believe", "Secret", "Top", "Guess"]
  @@genre = ["Fiction","Non-Fiction"]
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  # validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_inclusion_of :category, in: @@genre
validates_format_of :title, with: /Won\'t Believe|Secret|Top [0-9]|Guess/
  # validates :title, inclusion: { in: @@clickbait }
end
