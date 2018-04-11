class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :includes_words_in_title

	def includes_words_in_title
		if title != nil
			if !title.include?("Won't Believe") 
				errors.add(:title, "Need to include clickbait")
			end
		end
	end

end
