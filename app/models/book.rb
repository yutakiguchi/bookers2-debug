class Book < ApplicationRecord
	belongs_to :user
	has_many :book_coments,dependent: :destroy
	has_many :favorites,dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.looks(search,word)
		if search=="perfect_match"
			@book=Book.where("title LIKE?","#{word}")
		elsif search=="forward_match"
			@book=Book.where("title LIKE?","#{word}%")
		elsif search=="backword_match"
			@book=Book.where("title LIKE?","%#{word}")
		else search=="partial_match"
			@book=Book.where("title LIKE?","%#{word}%")
		
		end
	end

	def favorited_by?(user)
		favorites.where(user_id:user.id).exists?
	end

end
