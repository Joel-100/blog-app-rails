class Post < ApplicationRecord
  after_create :update_posts_counter
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  def update_posts_counter
    User.find(author.id).increment!(:posts_counter)
  end

  def get_recent_comments
    Comment.where(post: post.id).limit(5)
  end
end
