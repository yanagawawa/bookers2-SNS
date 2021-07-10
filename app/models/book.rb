class Book < ApplicationRecord

	belongs_to :user

	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    def favorites_lank_week
      Book.joins(:favorites).where(favorits: { created_at:　0.days.ago.prev_week..0.days.ago.prev_week(:sunday)}).group(:id).order("count(*) desc")
    end
  has_many :favorited_users, through: :favorites, source: :user
  has_many :categories, dependent: :destroy



	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
