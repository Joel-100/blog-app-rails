require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'update_comments_counter should increment comments_counter' do
    post = Post.create(title: 'First post on the blog', comments_counter: 0, likes_counter: 0)
    comment = Comment.create(post:, Text: 'Welcome!')
    comment.update_comments_counter
    expect(post.comments_counter).to eq(1)
  end
end
