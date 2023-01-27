class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  after_create :update_posts_counter
  after_initialize :set_default

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }

  def update_posts_counter
    User.find(author.id).increment!(:posts_counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def set_default
    self.likes_counter = 0 if likes_counter.nil?
    self.comments_counter = 0 if comments_counter.nil?
  end
end
