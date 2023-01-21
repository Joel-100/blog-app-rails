class Post < ApplicationRecord
  after_create :update_posts_counter
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def update_posts_counter
    User.find(author.id).increment!(:posts_counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
