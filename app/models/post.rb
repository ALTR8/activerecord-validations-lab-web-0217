class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :clickbait

	belongs_to :author

	def clickbait
		clickbait_array = ["Won't Believe", "Secret", "Top", "Guess"]
		clickbait_array.each do |clickbait|
			if title.present? && !title.include?(clickbait)
				errors.add(:title, "INVALID")
				return false
			else
				return true
			end
		end
	end
end
