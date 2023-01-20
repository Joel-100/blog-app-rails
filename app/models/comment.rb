class Comment < ApplicationRecord
  after_create :update_comments_counter
  belongs_to :author, class_name: "User"
  belongs_to :post

  def update_comments_counter
    Post.find(post.id).increment!(:comments_counter)
  end
end
