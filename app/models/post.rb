class CategoryValidator < ActiveModel::Validator
	def validate(post)
		unless ["Fiction", "Nonfiction"].include? post.category
			post.errors[:title] << 'Invalid category. Need: Fiction, Nonfiction'
		end
	end
end

class ClickBaitValidator < ActiveModel::Validator
	def validate(post)
		if post.title
			unless post.title.starts_with? "You Won't Believe"
				post.errors[:title] << 'Non-clickbait title.'
			end
		end
	end
end


class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
	validates :summary, length: {maximum: 15}
	validates_with CategoryValidator
	validates_with ClickBaitValidator
	# , if: -> {title}
	# validates :phone_number, length: {is: 10}
end

